# Yandex.Disk-клиент в Docker-контейнере

Установка производится аналогично локальной версии, просто изучите справку:

```
docker run -it teran/yandex-disk --help
```


Для большей безопасности желательно поместить файл настроек и файл ключа 
во внешнюю папку (вне контейнера) и смонтировать её, например, в папку data:

```
docker run -d \
  -v /Users/teran/yd-config:/root/.config/yandex-disk:ro \
  -v /Users/teran/Downloads/Yandex.Disk:/data \
  teran/yandex-disk start -D --dir=/data
```

Для запуска нескольких экземпляров было бы правильно иметь по отдельному
ключу на каждый.
