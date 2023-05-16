# Собираем образ на основе образа с окружением ЯП
FROM baseimage:v1

# Copy the logger code to the container
COPY ./logger /home/testuser/logger

# Создание папки
USER root
RUN mkdir logs && chmod -R a+rwx logs && chown -R testuser:testuser logs

# Set the working directory to the logger directory
WORKDIR /home/testuser/logger


EXPOSE 8000

# Точка входа в программу
ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0"]
