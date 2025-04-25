from django.db import models
from django.contrib.auth.models import User
from products.models import Product

class Order(models.Model):
    STATUS_CHOICES = (
        ('pending', 'В обработке'),
        ('processing', 'Принят'),
        ('shipping', 'В доставке'),
        ('completed', 'Выполнен'),
        ('cancelled', 'Отменен'),
    )
    
    SHIPPING_CHOICES = (
        ('courier', 'Курьер'),
        ('pickup', 'Самовывоз'),
        ('post', 'Почта'),
    )
    
    PAYMENT_CHOICES = (
        ('cod', 'Наложенный платеж'),
        ('online', 'Онлайн оплата'),
    )
    
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='orders', verbose_name="Пользователь")
    full_name = models.CharField(max_length=255, verbose_name="ФИО")
    email = models.EmailField(verbose_name="Email")
    phone = models.CharField(max_length=20, verbose_name="Телефон")
    address = models.TextField(verbose_name="Адрес доставки")
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name="Статус")
    shipping_method = models.CharField(max_length=20, choices=SHIPPING_CHOICES, verbose_name="Способ доставки")
    payment_method = models.CharField(max_length=20, choices=PAYMENT_CHOICES, verbose_name="Способ оплаты")
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Итоговая сумма")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Дата обновления")

    class Meta:
        verbose_name = "Заказ"
        verbose_name_plural = "Заказы"
        ordering = ['-created_at']

    def __str__(self):
        return f"Заказ #{self.id} от {self.user.username}"


class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items', verbose_name="Заказ")
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name="Товар")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена")
    quantity = models.PositiveIntegerField(verbose_name="Количество")

    class Meta:
        verbose_name = "Товар в заказе"
        verbose_name_plural = "Товары в заказе"

    def __str__(self):
        return f"{self.quantity} x {self.product.name} в заказе #{self.order.id}"

    def get_total_price(self):
        return self.price * self.quantity
