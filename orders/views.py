from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.conf import settings
from cart.models import CartItem
from .models import Order, OrderItem
from .forms import OrderForm

@login_required
def checkout(request):
    cart_items = CartItem.objects.filter(user=request.user)
    
    if not cart_items.exists():
        messages.warning(request, 'Ваша корзина пуста')
        return redirect('cart:cart_detail')
    
    total = sum(item.get_total_price() for item in cart_items)
    
    if request.method == 'POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            order = form.save(commit=False)
            order.user = request.user
            order.total_amount = total
            order.save()
            
            # Create order items
            for cart_item in cart_items:
                OrderItem.objects.create(
                    order=order,
                    product=cart_item.product,
                    price=cart_item.product.get_display_price(),
                    quantity=cart_item.quantity
                )
            
            # Clear cart
            cart_items.delete()
            
            # Send order confirmation email
            send_order_confirmation_email(order)
            
            messages.success(request, 'Ваш заказ успешно оформлен!')
            return redirect('orders:order_confirmation', order_id=order.id)
    else:
        # Pre-fill form with user data
        initial_data = {
            'full_name': f"{request.user.first_name} {request.user.last_name}",
            'email': request.user.email,
            'phone': request.user.profile.phone,
            'address': request.user.profile.address
        }
        form = OrderForm(initial=initial_data)
    
    context = {
        'form': form,
        'cart_items': cart_items,
        'total': total
    }
    
    return render(request, 'orders/checkout.html', context)

@login_required
def order_confirmation(request, order_id):
    order = Order.objects.get(id=order_id, user=request.user)
    
    context = {
        'order': order
    }
    
    return render(request, 'orders/order_confirmation.html', context)

@login_required
def order_history(request):
    orders = Order.objects.filter(user=request.user).order_by('-created_at')
    
    context = {
        'orders': orders
    }
    
    return render(request, 'orders/order_history.html', context)

@login_required
def order_detail(request, order_id):
    order = Order.objects.get(id=order_id, user=request.user)
    
    context = {
        'order': order
    }
    
    return render(request, 'orders/order_detail.html', context)

def send_order_confirmation_email(order):
    subject = f'Подтверждение заказа #{order.id}'
    message = render_to_string('orders/email/order_confirmation_email.html', {
        'order': order
    })
    send_mail(
        subject,
        message,
        settings.DEFAULT_FROM_EMAIL,
        [order.email],
        html_message=message
    )
