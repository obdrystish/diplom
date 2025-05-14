from django.contrib import admin
from .models import Order, OrderItem
from cart.cart import Cart

class OrderItemInline(admin.TabularInline):
    model = OrderItem
    raw_id_fields = ['product']
    extra = 0

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'full_name', 'phone', 'email', 'address', 'status', 'shipping_method', 'payment_method', 'total_amount', 'created_at']
    list_filter = ['status', 'shipping_method', 'payment_method', 'created_at', 'updated_at']
    search_fields = ['id', 'full_name', 'email', 'phone', 'address', 'user__username']
    inlines = [OrderItemInline] 