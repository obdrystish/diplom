from django.shortcuts import render, get_object_or_404
from django.db.models import Q
from .models import Product, Category, Brand, Review
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .forms import ReviewForm
from cart.forms import CartAddProductForm

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

def catalog(request):
    products = Product.objects.all()
    categories = Category.objects.all()
    brands = Brand.objects.all()
    
    # Filter by category
    category_slug = request.GET.get('category')
    if category_slug:
        category = get_object_or_404(Category, slug=category_slug)
        products = products.filter(category=category)
    
    # Filter by brand
    brand_slug = request.GET.get('brand')
    if brand_slug:
        brand = get_object_or_404(Brand, slug=brand_slug)
        products = products.filter(brand=brand)
    
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
    
    # Sort products
    sort_by = request.GET.get('sort', 'created_at')
    if sort_by == 'price_asc':
        products = products.order_by('price')
    elif sort_by == 'price_desc':
        products = products.order_by('-price')
    elif sort_by == 'popularity':
        products = products.order_by('-popularity')
    elif sort_by == 'newest':
        products = products.order_by('-created_at')
    
    context = {
        'products': products,
        'categories': categories,
        'brands': brands,
        'current_category': category_slug,
        'current_brand': brand_slug,
        'min_price': min_price,
        'max_price': max_price,
        'search_query': search_query,
        'sort_by': sort_by
    }
    
    return render(request, 'products/catalog.html', context)

def product_detail(request, slug):
    product = get_object_or_404(Product, slug=slug)
    reviews = product.reviews.all()
    
    # Increment product popularity
    product.popularity += 1
    product.save()
    
    # Handle review form
    if request.method == 'POST' and 'submit_review' in request.POST:
        review_form = ReviewForm(request.POST)
        if review_form.is_valid():
            review = review_form.save(commit=False)
            review.product = product
            review.user = request.user
            review.save()
            return redirect(product.get_absolute_url())
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
        'cart_product_form': cart_product_form
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

def product_list(request):
    products = Product.objects.all()
    categories = Category.objects.all()
    brands = Brand.objects.all()
    
    # Filter by category
    category_slug = request.GET.get('category')
    if category_slug:
        category = get_object_or_404(Category, slug=category_slug)
        products = products.filter(category=category)
    
    # Filter by brand
    brand_slug = request.GET.get('brand')
    if brand_slug:
        brand = get_object_or_404(Brand, slug=brand_slug)
        products = products.filter(brand=brand)
    
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
    
    # Sort products
    sort_by = request.GET.get('sort', 'created_at')
    if sort_by == 'price_asc':
        products = products.order_by('price')
    elif sort_by == 'price_desc':
        products = products.order_by('-price')
    elif sort_by == 'popularity':
        products = products.order_by('-popularity')
    elif sort_by == 'newest':
        products = products.order_by('-created_at')
    
    context = {
        'products': products,
        'categories': categories,
        'brands': brands,
        'current_category': category_slug,
        'current_brand': brand_slug,
        'min_price': min_price,
        'max_price': max_price,
        'search_query': search_query,
        'sort_by': sort_by
    }
    
    return render(request, 'products/product_list.html', context)
