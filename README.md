# bl33d_microservices

[![Build Status](https://travis-ci.com/Otus-DevOps-2020-08/bl33d_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2020-08/bl33d_microservices)

## ДЗ № 20

- Развернут миникуб
- Обновлены манифесты для Reddit app, приложение запущено в локальном кластере миникуба
- Приложение запущено к кластере GCP

## ДЗ № 19

- В GCP развернут kuber кластер версии 1.18, следуя руководству kubernetes-the-hard-way
- Написаны и пременены манифесты для деплойментов Reddit App

## ДЗ № 18

[Ссылка на dockerhub](https://hub.docker.com/u/tomorrowcanw8).

- Развернут EFK стек
- Включен централизованный сбор логов для post и ui сервисов
- Развернут Zipkin
- Включен трейсинг

Версия приложения с "ошибкой" долго обрабатывает посты из-за `time.sleep(3)` на [167 строке](https://github.com/Artemmkin/bugged-code/blob/master/post-py/post_app.py#L167) в функции find_post.

## ДЗ № 17

[Ссылка на dockerhub](https://hub.docker.com/u/tomorrowcanw8).

- Выполнен рефакторинг структуры проекта
- Написаны Dockerfile для promeheus, mongodb-exporter и blackbox-exporter
- В проект добавлены новые контейнеры (prome, mongodb-exporter, blackbox-exporter)
- Написан Makefile

## ДЗ № 16

[Ссылка на канал в slack](https://app.slack.com/client/T6HR0TUP3/C01AGQLQVQU) для проверки интеграции с GitLab CI.

- Написан playbook для ansible, который вызывает terraform для создания ВМ, устанвливает там docker и gitlab ci в контейнере через docker-compose
- Создан проект в GitLab CI
- Написан pipline для тестирования Reddit
- Добавлен и зарегистрирован раннер
- На стейдже Build запускается билд docker образа с reddit, который потом пушится в docker hub.
- Разворачивание и регистрация GitLab Runner реализована через docker-compose, который вызывается через ansible
- Настроена интеграция GitLab и Slack

## ДЗ № 15

Базовое имя проекта docker-compose образуется из названия каталога проекта.
Это можно изменить, установив переменную окружения COMPOSE_PROJECT_NAME или с помощью ключа -p, например `docker-compose -p my_project_name up`

- Выполнены практические задания
- Добавлены проект docker-compose и override файл к нему

## ДЗ № 14

- Добавлены Dockerfile для микросервисного Reddit App
- Образы ui и comment оптимизированы

## ДЗ № 13

- Установлен docker, практика с базовыми командами
- Установлен docker-machine, на удаленом хосте развернут docker daemon
- Добавлен Dockerfile описывающий билд образа с Reddit app
- Добавлена конфигурация Terraform для деплоя инстансов в YC под docker хосты
- Добавлена конфигурация Ansible для запуска Terraform и деплоя docker
- Добавлена конфигурация Packer для создания образа с установленным docker
