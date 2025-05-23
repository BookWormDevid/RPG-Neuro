# Используем образ python slim
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем системные зависимости
RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Копируем код приложения и зависимости
COPY ./ ./

# Устанавливаем Python-зависимости
RUN pip install -r requirements.txt

# Открываем порт для Flask
EXPOSE 5000

# Команда для запуска приложения
CMD ["python", "app.py"]
