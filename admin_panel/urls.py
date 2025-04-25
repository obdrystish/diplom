from django.urls import path
from . import views

urlpatterns = [
    path('', views.admin_dashboard, name='admin_dashboard'),
    # Здесь можно добавить дополнительные маршруты для админ-панели
] 