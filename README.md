# Sports Nutrition Shop

Интернет-магазин спортивного питания на Django.

## Установка и запуск

1. Клонируйте репозиторий:
```bash
git clone https://github.com/your-username/sports-nutrition-shop.git
cd sports-nutrition-shop
```

2. Создайте и активируйте виртуальное окружение:
```bash
# Windows
python -m venv venv
.\venv\Scripts\activate

# Linux/Mac
python3 -m venv venv
source venv/bin/activate
```

3. Установите зависимости:
```bash
pip install -r requirements.txt
```

4. Создайте файл `.env` в корневой директории со следующими переменными:
```
DB_NAME=your_db_name
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_HOST=localhost
DB_PORT=3306
SECRET_KEY=your_secret_key
```

5. Примените миграции:
```bash
python manage.py migrate
```

6. Запустите сервер:
```bash
python manage.py runserver
```

Сайт будет доступен по адресу: http://127.0.0.1:8000/

## Требования
- Python 3.8+
- MySQL Server
- pip (менеджер пакетов Python)