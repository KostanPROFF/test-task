# Задание
 - Реализовать тривиальное HTTP "Hello, world!" web-приложение на любом удобном Вам языке программирования и завернуть его в clound native окружение.

# Требования:
 - Dockerfile, который докеризует приложение.
 - Приложение должно иметь health-check и ready-check.
 - Приложение должно предоставлять metrics endpoint для Prometheus (метрики - на Ваше усмотрение).
 - Grafana dashboard с визуализацией метрик.
 - docker-compose.yml, который запускает приложение со всем необходимым окружением (Prometheus и Grafana).

# Реализация 
 - Dockerfile c Python Web-приложением на Flask с названием *testtask* которые выводит на 5000 TCP порт страницу "Hello world".
 - Приложение имеет ready-check в виде образа waisbrot/wait который через переменную окружения TARGETS=testtask:5000 обращается к сервису и дожидаетя его запуска.
 - Приложение имеет health-check через встроенную функцию HEALTHCHECK, обращается на 5000 TCP порт через curl и, в случае получения отрицательного HTTP кода ответа, выходит при получении не 0 
ответа.
 - Приложение предоставляет metrics endpoint для Prometheus через prometheus flask exporter (https://github.com/rycus86/prometheus_flask_exporter) встроенный в код и отдающий метрики по роуту 
/metrics.
 - Подключена связка Prometheus и Grafana с Flask dashboard с визуализацией метрик.
 - Все оформлено в docker-compose.yml файл, который запускает приложение со всеми необходимыми образами.

# Метрики
 - Посмотреть метрики можно в Grafana обратившись к порту 3000 и ввести логин/пароль: admin/testtask  
 - Также можно обратиться через curl по адресу http://localhost:5000/metrics  
  
