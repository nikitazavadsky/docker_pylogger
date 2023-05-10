# Используем ubuntu:20.04 как базовый образ
FROM ubuntu:20.04 AS builder-image

# Используем неинтерактивный режим (не требуется ввод Y/N)
ARG DEBIAN_FRONTEND=noninteractive

# Устанавливаем необходимые для разработки пакеты (python и т.п.)
RUN apt-get update && apt-get install --no-install-recommends -y python3.9 python3.9-dev python3.9-venv python3-pip python3-wheel build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Установка библиотек
RUN pip3 install --no-cache-dir uvicorn fastapi 

# Создаем пользователя и папку для него в /home/
RUN useradd --create-home testuser

USER testuser
WORKDIR /home/testuser/

EXPOSE 8000

# Сообщения приложения отправляются напрямую консоль (отключение буферизации)
ENV PYTHONUNBUFFERED=1