from django import forms
from .models import Order

class OrderForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = [
            'full_name',
            'email',
            'phone',
            'address',
            'shipping_method',
            'payment_method',
        ]
        widgets = {
            'shipping_method': forms.RadioSelect,
            'payment_method': forms.RadioSelect,
        } 