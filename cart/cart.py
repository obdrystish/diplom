from decimal import Decimal
from django.conf import settings
from products.models import Product

class Cart:
    def __init__(self, request):
        """Инициализация корзины."""
        self.session = request.session
        cart = self.session.get(settings.CART_SESSION_ID)
        if not cart:
            # Сохраняем пустую корзину в сессии
            cart = self.session[settings.CART_SESSION_ID] = {}
        self.cart = cart

    def add(self, product, quantity=1, update_quantity=False):
        """Добавление товара в корзину или обновление его количества."""
        product_id = str(product.id)

        if product.stock_quantity == 0:
            # Товар отсутствует на складе, не добавляем в корзину
            return False

        if product_id not in self.cart:
            self.cart[product_id] = {'quantity': 0,
                                     'price': str(product.get_display_price())}
        
        if update_quantity:
            self.cart[product_id]['quantity'] = quantity
        else:
            self.cart[product_id]['quantity'] += quantity
        self.save()

    def save(self):
        # Помечаем сессию как "измененную", чтобы убедиться, что она сохранена
        self.session.modified = True

    def remove(self, product):
        """Удаление товара из корзины."""
        product_id = str(product.id)
        if product_id in self.cart:
            del self.cart[product_id]
            self.save()

    def __iter__(self):
        """
        Перебираем товары в корзине и получаем товары из базы данных.
        """
        product_ids = self.cart.keys()
        print(f"DEBUG: Product IDs from session: {product_ids}")
        # Получаем объекты Product и добавляем их в корзину
        products = Product.objects.filter(id__in=product_ids)
        print(f"DEBUG: Products retrieved from DB: {products}")

        cart = self.cart.copy()
        for product in products:
            cart[str(product.id)]['product'] = product

        for item in cart.values():
            item['price'] = Decimal(item['price'])
            item['total_price'] = item['price'] * item['quantity']
            yield item

    def __len__(self):
        """Считаем общее количество товаров в корзине."""
        return sum(item['quantity'] for item in self.cart.values())

    def get_total_price(self):
        """Рассчитываем общую стоимость товаров в корзине."""
        return sum(Decimal(item['price']) * item['quantity'] for item in self.cart.values())

    def clear(self):
        # Удаляем корзину из сессии
        del self.session[settings.CART_SESSION_ID]
        self.save() 