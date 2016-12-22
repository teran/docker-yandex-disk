# Yandex.Disk official client in Docker

Usage is exactly the same as for local installation, for more details:

```
docker run -it teran/yandex-disk --help
```

For better security it's fine to have config and token file to be placed
somewhere outside the container and simply mounted within such as data folder:

```
docker run -d \
  -v /Users/teran/yd-config:/root/.config/yandex-disk:ro \
  -v /Users/teran/Downloads/Yandex.Disk:/data \
  teran/yandex-disk start -D --dir=/data
```

For multiple instances it's not such a bad idea to have dedicated tokens for
each one.
