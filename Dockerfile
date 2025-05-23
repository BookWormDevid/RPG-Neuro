# Используем образ с поддержкой CUDA для PyTorch, если нужен GPU, или CPU-образ
FROM pytorch/pytorch:2.3.0-cuda11.8-cudnn8-runtime

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
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