# bl33d_microservices

[![Build Status](https://travis-ci.com/Otus-DevOps-2020-08/bl33d_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2020-08/bl33d_microservices)

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
