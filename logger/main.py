import os
from datetime import datetime

from fastapi import FastAPI, Query

app = FastAPI()

@app.get("/")
async def write_log(text: str = Query(...)):
    now = datetime.now()

    # Создаем структуру папок для логов
    log_dir = os.path.join(os.getcwd(), "logs")
    os.makedirs(log_dir, exist_ok=True)

    # Создаем путь к новому или уже имеющемуся логу
    log_file = os.path.join(log_dir, f"{str(now.year)}-{str(now.month).zfill(2)}-{str(now.day).zfill(2)}-{now.hour}.log")
    log_text = f"[{now.strftime('%Y-%m-%d %H:%M:%S')}] - [{text}]\n"
    with open(log_file, "a") as f:
        f.write(log_text)
    
    return {"message": log_text, "logdir": log_dir}
