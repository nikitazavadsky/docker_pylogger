# Собираем образ на основе образа с окружением ЯП
FROM baseimage:v1

# Установка библиотек
RUN pip3 install --no-cache-dir uvicorn fastapi 

# Копируем код приложения
COPY ./log_collector/ .

# Точка входа в программу
ENTRYPOINT [ "python3", "log_collector.py" ]
