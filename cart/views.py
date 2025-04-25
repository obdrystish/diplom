from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from products.models import Product
from .cart import Cart
from .forms import CartAddProductForm
from django.views.decorators.http import require_POST

@login_required
def cart_detail(request):
    cart = Cart(request)
    for item in cart:
        item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'], 'update': True})
    return render(request, 'cart/cart_detail.html', {'cart': cart})

@require_POST
def cart_add(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    form = CartAddProductForm(request.POST)
    if form.is_valid():
        cd = form.cleaned_data
        cart.add(product=product,
                 quantity=cd['quantity'],
                 update_quantity=cd['update'])
    # TODO: Добавить обработку AJAX запросов, если нужно
    # В оригинальном коде была проверка request.headers.get('x-requested-with') == 'XMLHttpRequest'
    return redirect('cart:cart_detail') 

@require_POST
def cart_remove(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    # TODO: Добавить обработку AJAX запросов
    return redirect('cart:cart_detail')

@login_required
def update_cart(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id, user=request.user)
    quantity = int(request.POST.get('quantity', 1))
    
    if quantity > 0:
        cart_item.quantity = quantity
        cart_item.save()
    else:
        cart_item.delete()
    
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        cart_items = CartItem.objects.filter(user=request.user)
        total = sum(item.get_total_price() for item in cart_items)
        
        return JsonResponse({
            'status': 'success',
            'total': total,
            'item_total': cart_item.get_total_price() if quantity > 0 else 0,
            'cart_count': cart_items.count()
        })
    
    return redirect('cart:cart_detail')

@login_required
def remove_from_cart(request, item_id):
    cart_item = get_object_or_404(CartItem, id=item_id, user=request.user)
    cart_item.delete()
    
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        cart_items = CartItem.objects.filter(user=request.user)
        total = sum(item.get_total_price() for item in cart_items)
        
        return JsonResponse({
            'status': 'success',
            'total': total,
            'cart_count': cart_items.count()
        })
    
    return redirect('cart:cart_detail')
