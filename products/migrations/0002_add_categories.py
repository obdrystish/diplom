from django.db import migrations

def add_categories(apps, schema_editor):
    Category = apps.get_model('products', 'Category')
    categories = [
        {
            'name': 'Протеин',
            'slug': 'protein',
            'description': 'Протеиновые добавки для набора мышечной массы и восстановления'
        },
        {
            'name': 'Аминокислоты',
            'slug': 'amino',
            'description': 'Аминокислотные комплексы для поддержки мышечного роста и восстановления'
        },
        {
            'name': 'Гейнер',
            'slug': 'gainer',
            'description': 'Высококалорийные смеси для набора массы'
        },
        {
            'name': 'Креатин',
            'slug': 'creatine',
            'description': 'Креатиновые добавки для увеличения силы и выносливости'
        },
        {
            'name': 'Витамины',
            'slug': 'vitamins',
            'description': 'Витаминные комплексы для поддержания здоровья'
        },
        {
            'name': 'БАДы',
            'slug': 'supplements',
            'description': 'Биологически активные добавки для поддержания здоровья'
        },
        {
            'name': 'Прочее',
            'slug': 'other',
            'description': 'Другие спортивные добавки и аксессуары'
        }
    ]
    
    for category_data in categories:
        Category.objects.get_or_create(
            slug=category_data['slug'],
            defaults={
                'name': category_data['name'],
                'description': category_data['description']
            }
        )

def remove_categories(apps, schema_editor):
    Category = apps.get_model('products', 'Category')
    Category.objects.filter(slug__in=['protein', 'amino', 'gainer', 'creatine', 'vitamins', 'supplements', 'other']).delete()

class Migration(migrations.Migration):
    dependencies = [
        ('products', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(add_categories, remove_categories),
    ] 