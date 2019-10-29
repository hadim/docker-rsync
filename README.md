# docker-rsync

[![Docker Automated build](https://img.shields.io/docker/automated/hadim/docker-rsync.svg)](https://hub.docker.com/r/hadim/docker-rsync 'DockerHub')
[![Docker Build Status](https://img.shields.io/docker/build/hadim/docker-rsync.svg)](https://hub.docker.com/r/hadim/docker-rsync 'DockerHub')
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/hadim/docker-rsync.svg)](https://hub.docker.com/r/hadim/docker-rsync 'DockerHub')
[![Docker Pulls](https://img.shields.io/docker/pulls/hadim/docker-rsync.svg)](https://hub.docker.com/r/hadim/docker-rsync 'DockerHub')

A Docker image that run `rsync` periodically using `cron` and [`s6-overlay`](https://github.com/just-containers/s6-overlay).

## How to use

### Docker Hub

Use the following `docker-compose.yml` file:

```yaml
version: '3'

services:

  rsync:
    container_name: rsync
    image: hadim/docker-rsync
    restart: unless-stopped
    volumes:
      - ../data/source:/data/source:ro
      - ../data/destination:/data/destination
    environment:
      TIMEZONE: "America/Montreal"
      PUID: 1000
      PGID: 1000
      RSYNC_OPTIONS: "--archive --delete --verbose --timeout=3600 --progress"
      CRONTAB_OPTIONS: "0 0 * * *"
```

### Cloning
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

## Configurations

### Data Volumes

| Directory | Description |
| --- | --- |
| `/data/source:ro` | Source Directory |
| `/data/destination` | Destination Directory |

### Environment Variables

| Parameter | Function | Default |
| --- | --- | --- |
| `TIMEZONE` | [Timezone string](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | `"America/Montreal"` |
| `PUID` | User ID (use `id $USER`) | `1000` |
| `PGID` | Group ID (use `id $USER`) | `1000` |
| `CRONTAB_OPTIONS` | Crontab options | `"0 0 * * *"` |
| `RSYNC_OPTIONS` | Rsync options | `"--archive --delete --verbose --timeout=3600 --progress"` |

## License

[MIT License](./LICENSE).

## Author

- [Hadrien Mary](https://github.com/hadim)
