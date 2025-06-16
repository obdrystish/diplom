from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Q
from .models import Product, Category, Brand, Review
from orders.models import OrderItem
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .forms import ReviewForm
from cart.forms import CartAddProductForm
from django.contrib import messages

def home(request):
    featured_products = Product.objects.filter(is_featured=True)[:8]
    categories = Category.objects.all()
    return render(request, 'products/home.html', {
        'featured_products': featured_products,
        'categories': categories
    })

def about_us(request):
    """Отображает страницу 'О нас'."""
    return render(request, 'about_us.html')

def contact_us(request):
    """Отображает страницу 'Контакты'."""
    # Здесь можно добавить логику для обработки контактной формы, если она будет
    return render(request, 'contact_us.html')

def product_list(request):
    products = Product.objects.all()
    categories = Category.objects.all()
    brands = Brand.objects.all()
    flavors = Product.objects.exclude(flavor__exact='').values_list('flavor', flat=True).distinct().order_by('flavor')

    # Filter by category
    selected_category_ids = request.GET.getlist('category')
    if selected_category_ids:
        products = products.filter(category__id__in=selected_category_ids)

    # Filter by brand
    selected_brand_slugs = request.GET.getlist('brand')
    if selected_brand_slugs:
        products = products.filter(brand__slug__in=selected_brand_slugs)

    # Filter by flavor
    selected_flavor_names = request.GET.getlist('flavor')
    if selected_flavor_names:
        products = products.filter(flavor__in=selected_flavor_names)

    # Filter by price range
    min_price = request.GET.get('min_price')
    max_price = request.GET.get('max_price')
    if min_price:
        products = products.filter(price__gte=min_price)
    if max_price:
        products = products.filter(price__lte=max_price)

    # Search by name
    search_query = request.GET.get('q')
    if search_query:
        products = products.filter(
            Q(name__icontains=search_query) | 
            Q(description__icontains=search_query)
        )

    context = {
        'products': products,
        'categories': categories,
        'brands': brands,
        'flavors': flavors,
        'current_category': selected_category_ids,
        'current_brand': selected_brand_slugs,
        'current_flavor': selected_flavor_names,
        'min_price': min_price,
        'max_price': max_price,
        'search_query': search_query,
    }
    
    return render(request, 'products/catalog.html', context)

def product_detail(request, slug):
    product = get_object_or_404(Product, slug=slug)
    reviews = product.reviews.all()
    
    # Increment product popularity
    product.popularity += 1
    product.save()
    
    # Check if user has already reviewed this product
    user_has_reviewed = False
    if request.user.is_authenticated:
        user_has_reviewed = Review.objects.filter(product=product, user=request.user).exists()

    # Handle review form
    if request.method == 'POST' and 'submit_review' in request.POST:
        if request.user.is_authenticated and not user_has_reviewed: # Allow submission only if authenticated and no existing review
            review_form = ReviewForm(request.POST)
            if review_form.is_valid():
                review = review_form.save(commit=False)
                review.product = product
                review.user = request.user
                review.save()
                messages.success(request, 'Ваш отзыв успешно добавлен!')
                return redirect(product.get_absolute_url())
            else:
                messages.error(request, 'Пожалуйста, исправьте ошибки в форме отзыва.')
        elif user_has_reviewed:
            messages.warning(request, 'Вы уже оставили отзыв для этого товара.')
        else:
            messages.warning(request, 'Для того чтобы оставить отзыв, пожалуйста, войдите в систему.')
        # Re-initialize the form in case of errors or existing review
        review_form = ReviewForm(request.POST if request.method == 'POST' else None)
    else:
        review_form = ReviewForm()
    
    # Форма добавления в корзину (передаем сюда, а не создаем в шаблоне)
    cart_product_form = CartAddProductForm()

    related_products = Product.objects.filter(category=product.category).exclude(id=product.id)[:4]
    
    context = {
        'product': product,
        'reviews': reviews,
        'review_form': review_form,
        'related_products': related_products,
        'cart_product_form': cart_product_form,
        'user_has_reviewed': user_has_reviewed, # Pass this to the template
    }
    
    return render(request, 'products/product_detail.html', context)

def category_detail(request, slug):
    category = get_object_or_404(Category, slug=slug)
    products = Product.objects.filter(category=category)
    
    context = {
        'category': category,
        'products': products
    }
    
    return render(request, 'products/category_detail.html', context)

def brand_detail(request, slug):
    brand = get_object_or_404(Brand, slug=slug)
    products = Product.objects.filter(brand=brand)
    
    context = {
        'brand': brand,
        'products': products
    }
    
    return render(request, 'products/brand_detail.html', context)

@login_required
def add_review(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.product = product
            review.user = request.user
            review.save()
            return JsonResponse({'status': 'success'})
    
    return JsonResponse({'status': 'error'})

def category_list(request):
    categories = Category.objects.all()
    return render(request, 'products/category_list.html', {'categories': categories})
