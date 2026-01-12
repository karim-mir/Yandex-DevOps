# YandexDevOps
Простое веб-приложение, которое развернуто на `Docker` контейнере

## Запуск 
- Необходимо собрать образ с помощью команды:
```
docker build -t my-web-app:latest fullpath
# fullpath - полный путь до директории test-project
```
- Запустить контейнер из образа:
```commandline
docker run -d -p 8080:80 --name my-web-app-container my-web-app:latest
```
- Проверить в браузере:

http://localhost:8080
