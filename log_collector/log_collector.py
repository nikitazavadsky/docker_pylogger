import os

def collect_logs():
    logs_dir = os.path.join(os.getcwd(), "logs") # указываем папку с логами
    for foldername, subfolders, filenames in os.walk(logs_dir): # проход по всем папкам и файлам
        for filename in filenames:
            if filename.endswith(".log"): # Если файл имеет расширение .log
                log_file = os.path.join(foldername, filename)
                with open(log_file, "r") as f:
                    print(f.read()) # Вывод содержимого в консоль

collect_logs()