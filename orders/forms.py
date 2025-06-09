from django import forms
from django.core.exceptions import ValidationError
import re # Импортируем модуль re для работы с регулярными выражениями
from .models import Order

class OrderForm(forms.ModelForm):
    shipping_method = forms.ChoiceField(
        choices=Order.SHIPPING_CHOICES,
        widget=forms.RadioSelect,
        required=True
    )
    payment_method = forms.ChoiceField(
        choices=Order.PAYMENT_CHOICES,
        widget=forms.RadioSelect,
        required=True
    )

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
            'phone': forms.TextInput(attrs={'maxlength': '11'}),
            'address': forms.Textarea(attrs={'rows': 3}), # Сохраняем существующий виджет Textarea
        }

    def clean_full_name(self):
        full_name = self.cleaned_data['full_name']
        if not re.match(r'^[а-яА-Яa-zA-Z\s\-]{1,50}$'
, full_name):
            raise ValidationError("ФИО должно содержать только буквы (кириллица/латиница), пробелы и дефисы, не более 50 символов.")
        return full_name

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        # Проверяем, что номер начинается с 8 и имеет ровно 11 символов (включая 8)
        if not re.match(r'^8\d{10}$', phone):
            raise ValidationError("Номер телефона должен начинаться с 8 и содержать 10 цифр после него (всего 11 символов).")
        return phone

    def clean_address(self):
        address = self.cleaned_data['address']
        # Допускаются буквы, цифры, пробелы, символы .,-#/
        if not re.match(r'^[а-яА-Яa-zA-Z0-9.,\s\-#/]+$'
, address):
            raise ValidationError("Введите корректный адрес. Допускаются буквы, цифры, пробелы, символы .,-#/")
        return address