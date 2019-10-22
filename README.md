# docker-rsync

A Docker image that run `rsync` periodically using `cron` and [`s6-overlay`](https://github.com/just-containers/s6-overlay).

## How to use

You need to clone this repository and build the repository:

```bash
git clone https://github.com/hadim/docker-rsync.git
cd docker-rsync/
docker-compose build
```

Edit `docker-compose.yml`. Then run the container:

```bash
docker-compose up -d
docker-compose logs -f rsync
```

## License

[MIT License](./LICENSE).

## Author

- [Hadrien Mary](https://github.com/hadim)
