from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import user_passes_test
from django.contrib import messages
from django.contrib.auth.models import User
from products.models import Product, Category, Brand
from orders.models import Order
from .forms import ProductForm, CategoryForm, BrandForm

def is_admin(user):
    return user.is_authenticated and user.is_staff

@user_passes_test(is_admin)
def admin_dashboard(request):
    products_count = Product.objects.count()
    orders_count = Order.objects.count()
    users_count = User.objects.count()
    recent_orders = Order.objects.order_by('-created_at')[:5]
    
    context = {
        'products_count': products_count,
        'orders_count': orders_count,
        'users_count': users_count,
        'recent_orders': recent_orders
    }
    
    return render(request, 'admin_panel/dashboard.html', context)

# Product management
@user_passes_test(is_admin)
def product_list(request):
    products = Product.objects.all()
    
    context = {
        'products': products
    }
    
    return render(request, 'admin_panel/product_list.html', context)

@user_passes_test(is_admin)
def product_create(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Товар успешно создан')
            return redirect('admin_panel:product_list')
    else:
        form = ProductForm()
    
    context = {
        'form': form
    }
    
    return render(request, 'admin_panel/product_form.html', context)

@user_passes_test(is_admin)
def product_update(request, pk):
    product = get_object_or_404(Product, pk=pk)
    
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            messages.success(request, 'Товар успешно обновлен')
            return redirect('admin_panel:product_list')
    else:
        form = ProductForm(instance=product)
    
    context = {
        'form': form,
        'product': product
    }
    
    return render(request, 'admin_panel/product_form.html', context)

@user_passes_test(is_admin)
def product_delete(request, pk):
    product = get_object_or_404(Product, pk=pk)
    
    if request.method == 'POST':
        product.delete()
        messages.success(request, 'Товар успешно удален')
        return redirect('admin_panel:product_list')
    
    context = {
        'product': product
    }
    
    return render(request, 'admin_panel/product_confirm_delete.html', context)

# Category management
@user_passes_test(is_admin)
def category_list(request):
    categories = Category.objects.all()
    
    context = {
        'categories': categories
    }
    
    return render(request, 'admin_panel/category_list.html', context)

@user_passes_test(is_admin)
def category_create(request):
    if request.method == 'POST':
        form = CategoryForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Категория успешно создана')
            return redirect('admin_panel:category_list')
    else:
        form = CategoryForm()
    
    context = {
        'form': form
    }
    
    return render(request, 'admin_panel/category_form.html', context)

@user_passes_test(is_admin)
def category_update(request, pk):
    category = get_object_or_404(Category, pk=pk)
    
    if request.method == 'POST':
        form = CategoryForm(request.POST, instance=category)
        if form.is_valid():
            form.save()
            messages.success(request, 'Категория успешно обновлена')
            return redirect('admin_panel:category_list')
    else:
        form = CategoryForm(instance=category)
    
    context = {
        'form': form,
        'category': category
    }
    
    return render(request, 'admin_panel/category_form.html', context)

@user_passes_test(is_admin)
def category_delete(request, pk):
    category = get_object_or_404(Category, pk=pk)
    
    if request.method == 'POST':
        category.delete()
        messages.success(request, 'Категория успешно удалена')
        return redirect('admin_panel:category_list')
    
    context = {
        'category': category
    }
    
    return render(request, 'admin_panel/category_confirm_delete.html', context)

# Brand management
@user_passes_test(is_admin)
def brand_list(request):
    brands = Brand.objects.all()
    
    context = {
        'brands': brands
    }
    
    return render(request, 'admin_panel/brand_list.html', context)

@user_passes_test(is_admin)
def brand_create(request):
    if request.method == 'POST':
        form = BrandForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Бренд успешно создан')
            return redirect('admin_panel:brand_list')
    else:
        form = BrandForm()
    
    context = {
        'form': form
    }
    
    return render(request, 'admin_panel/brand_form.html', context)

@user_passes_test(is_admin)
def brand_update(request, pk):
    brand = get_object_or_404(Brand, pk=pk)
    
    if request.method == 'POST':
        form = BrandForm(request.POST, request.FILES, instance=brand)
        if form.is_valid():
            form.save()
            messages.success(request, 'Бренд успешно обновлен')
            return redirect('admin_panel:brand_list')
    else:
        form = BrandForm(instance=brand)
    
    context = {
        'form': form,
        'brand': brand
    }
    
    return render(request, 'admin_panel/brand_form.html', context)

@user_passes_test(is_admin)
def brand_delete(request, pk):
    brand = get_object_or_404(Brand, pk=pk)
    
    if request.method == 'POST':
        brand.delete()
        messages.success(request, 'Бренд успешно удален')
        return redirect('admin_panel:brand_list')
    
    context = {
        'brand': brand
    }
    
    return render(request, 'admin_panel/brand_confirm_delete.html', context)

# Order management
@user_passes_test(is_admin)
def order_list(request):
    orders = Order.objects.all().order_by('-created_at')
    
    context = {
        'orders': orders
    }
    
    return render(request, 'admin_panel/order_list.html', context)

@user_passes_test(is_admin)
def order_detail(request, pk):
    order = get_object_or_404(Order, pk=pk)
    
    if request.method == 'POST':
        status = request.POST.get('status')
        if status:
            order.status = status
            order.save()
            messages.success(request, 'Статус заказа обновлен')
            return redirect('admin_panel:order_detail', pk=order.id)
    
    context = {
        'order': order
    }
    
    return render(request, 'admin_panel/order_detail.html', context)

# User management
@user_passes_test(is_admin)
def user_list(request):
    users = User.objects.all().order_by('-date_joined')
    
    context = {
        'users': users
    }
    
    return render(request, 'admin_panel/user_list.html', context)

@user_passes_test(is_admin)
def user_detail(request, pk):
    user = get_object_or_404(User, pk=pk)
    orders = Order.objects.filter(user=user).order_by('-created_at')
    
    if request.method == 'POST':
        action = request.POST.get('action')
        if action == 'block':
            user.is_active = False
            user.save()
            messages.success(request, 'Пользователь заблокирован')
        elif action == 'unblock':
            user.is_active = True
            user.save()
            messages.success(request, 'Пользователь разблокирован')
        return redirect('admin_panel:user_detail', pk=user.id)
    
    context = {
        'user_detail': user,
        'orders': orders
    }
    
    return render(request, 'admin_panel/user_detail.html', context)
