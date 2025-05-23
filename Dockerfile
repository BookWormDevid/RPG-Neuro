# Используем образ python slim
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем системные зависимости
RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Копируем файл с зависимостями
COPY requirements.txt .

# Устанавливаем Python-зависимости
RUN pip install -r requirements.txt

# Копируем весь root
COPY . .

# Указываем что app.py - flask приложение
ENV FLASK_APP=app.py


# Открываем порт для Flask
EXPOSE 5000

# Команда для запуска приложения
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
