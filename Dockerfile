FROM python:3.8
MAINTAINER Valentin Castillo <vcastillo@lsv-tech.com>

ARG target_env="local"
ARG django_settings="solinces.config.settings"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV TARGET_ENV=base
ENV DJANGO_SETTINGS_MODULE=$django_settings
ENV DJANGO_PORT=8000

RUN mkdir /backend /var/secrets
WORKDIR backend

RUN apt-get update \
    && apt-get install -y python3-dev musl-dev


# Copia requirements
COPY ./requirements/ /backend/requirements/

RUN pip install -r /backend/requirements/${TARGET_ENV}.txt

# Copia proyecto
COPY . .

RUN addgroup --gid 1000 docker \
    && adduser --gid 1000 --uid 1000 --disabled-password --gecos "" --quiet docker \
    && chown -R docker:docker /var/secrets /backend

USER docker