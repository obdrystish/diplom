from django import forms
from products.models import Product, Category, Brand, ProductImage

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['name', 'description', 'price', 'discount_price', 'stock_quantity', 'category', 'brand', 'weight', 'flavor', 'composition', 'is_featured']

class ProductImageForm(forms.ModelForm):
    class Meta:
        model = ProductImage
        fields = ['image', 'is_primary']

class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name', 'description']

class BrandForm(forms.ModelForm):
    class Meta:
        model = Brand
        fields = ['name', 'logo'] 