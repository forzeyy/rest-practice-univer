# Конвертер температуры из Цельсия в Фаренгейт

Простое REST API на Go с одним эндпоинтом для конвертации градусов из Цельсия в Фаренгейт.

### Метод
GET /api/temperature/{celsius}

Например:
http://localhost:8080/api/temperature/23

### Ответ
float value (например, при 23 градусах цельсия ответ будет 73.4)

## Сборка и запуск

Требования: Docker

~~~bash
docker build -t temperature-converter . # сборка
docker run -p 8080:8080 temperature-converter # запуск