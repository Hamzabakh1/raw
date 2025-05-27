# Metabase Heroku Deployment

This repository contains the configuration files needed to deploy Metabase on Heroku using Docker.

## Prerequisites

- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- [Docker](https://www.docker.com/get-started)
- [Git](https://git-scm.com/downloads)

## Setup

1. Clone this repository:
```bash
git clone <repository-url>
cd metabase-heroku1
```

2. Copy the example environment file and configure it:
```bash
cp configs/.env.example configs/.env
```

3. Update the environment variables in `configs/.env` with your specific configuration.

## Local Development

To run Metabase locally using Docker Compose:

```bash
docker-compose up
```

The application will be available at `http://localhost:3000`.

## Deployment to Heroku

1. Create a new Heroku app:
```bash
heroku create your-app-name
```

2. Add the Heroku container stack:
```bash
heroku stack:set container
```

3. Deploy to Heroku:
```bash
git push heroku main
```

4. Set up the environment variables:
```bash
heroku config:set $(cat configs/.env | xargs)
```

## Configuration

The main configuration files are:
- `Dockerfile`: Defines the container image
- `heroku.yml`: Specifies the build and run configuration for Heroku
- `docker-compose.yml`: Local development setup
- `configs/.env`: Environment variables

## License

MIT 