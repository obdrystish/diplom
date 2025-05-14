from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.conf import settings
from cart.cart import Cart
from .models import Order, OrderItem
from .forms import OrderForm

@login_required
def checkout(request):
    cart = Cart(request)
    cart_items = list(cart)
    if not cart_items:
        messages.warning(request, 'Ваша корзина пуста')
        return redirect('cart:cart_detail')
    total = cart.get_total_price()
    if request.method == 'POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            order = form.save(commit=False)
            order.user = request.user
            order.total_amount = total
            order.save()
            # Create order items
            for item in cart:
                OrderItem.objects.create(
                    order=order,
                    product=item['product'],
                    price=item['price'],
                    quantity=item['quantity']
                )
            cart.clear()
            send_order_confirmation_email(order)
            messages.success(request, 'Ваш заказ успешно оформлен!')
            return redirect('orders:order_payment', order_id=order.id)
    else:
        initial_data = {
            'full_name': f"{request.user.first_name} {request.user.last_name}",
            'email': request.user.email,
            'phone': getattr(getattr(request.user, 'profile', None), 'phone', ''),
            'address': getattr(getattr(request.user, 'profile', None), 'address', '')
        }
        form = OrderForm(initial=initial_data)
    context = {
        'form': form,
        'cart_items': cart_items,
        'total': total
    }
    return render(request, 'orders/checkout.html', context)

@login_required
def order_payment(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)
    if request.method == 'POST':
        order.status = 'completed'
        order.save()
        return redirect('orders:order_confirmation', order_id=order.id)
    return render(request, 'orders/order_payment.html', {'order': order})

@login_required
def order_confirmation(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)
    return render(request, 'orders/order_confirmation.html', {'order': order})

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
