from django.contrib import admin
from .models import Product, Category, Brand, ProductImage, Review

# Убираем простые регистрации, оставляем декораторы
# admin.site.register(Product)
# admin.site.register(Category)
# admin.site.register(Brand)
# admin.site.register(ProductImage)
# admin.site.register(Review)

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug')
    prepopulated_fields = {'slug': ('name',)}

@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('name', 'slug')
    prepopulated_fields = {'slug': ('name',)}

class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 1 # Количество дополнительных пустых форм для загрузки изображений

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'brand', 'category', 'price', 'stock_quantity', 'is_featured', 'created_at')
    list_filter = ('category', 'brand', 'is_featured', 'created_at')
    list_editable = ('price', 'stock_quantity', 'is_featured')
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ('name', 'description', 'brand__name', 'category__name')
    inlines = [ProductImageInline] # Позволяет добавлять изображения прямо на странице товара

@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('product', 'user', 'rating', 'created_at')
    list_filter = ('rating', 'created_at')
    search_fields = ('product__name', 'user__username', 'comment')

# Модель ProductImage уже зарегистрирована через ProductImageInline, 
# но можно зарегистрировать и отдельно, если нужен прямой доступ
# @admin.register(ProductImage)
# class ProductImageAdmin(admin.ModelAdmin):
#     list_display = ('product', 'image', 'is_primary') 