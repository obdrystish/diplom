from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from products.models import Product
from .cart import Cart
from .forms import CartAddProductForm
from django.views.decorators.http import require_POST
from django.contrib import messages

@login_required
def cart_detail(request):
    cart = Cart(request)
    # Принудительная итерация по корзине для загрузки всех элементов
    cart_items = list(cart) 
    for item in cart_items:
        item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'], 'update': True})
    total_price = cart.get_total_price() # Получаем общую стоимость
    return render(request, 'cart/cart_detail.html', {'cart_items': cart_items, 'total_price': total_price})

@login_required
@require_POST
def cart_add(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    form = CartAddProductForm(request.POST)
    if form.is_valid():
        cd = form.cleaned_data
        added = cart.add(product=product,
                          quantity=cd['quantity'],
                          update_quantity=cd['update'])
    
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return JsonResponse({'cart_quantity': len(cart), 'total_price': str(cart.get_total_price())})
    
    return redirect('products:product_detail', product.slug)

@login_required
@require_POST
def cart_remove(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    # TODO: Добавить обработку AJAX запросов
    return redirect('cart:cart_detail')

@login_required
@require_POST
def cart_update(request, item_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=item_id)
    form = CartAddProductForm(request.POST)
    if form.is_valid():
        cd = form.cleaned_data
        cart.add(product=product,
                quantity=cd['quantity'],
                update_quantity=True)
    return redirect('cart:cart_detail')
