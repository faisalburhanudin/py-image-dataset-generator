FROM python:3.6-alpine

WORKDIR /workspace

COPY requirements.txt .

RUN set -ex \
    && apk update && apk add --no-cache --virtual .build-deps \
        gcc \
        build-base \
        freetype-dev \
        libpng-dev \
        openblas-dev \
        libjpeg-turbo-dev \
    && pip install pip --upgrade \
    && pip install --no-cache-dir numpy \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps \
    && apk add --no-cache \
        libjpeg \
        openblas \
        chromium-chromedriver \
        chromium

COPY . .

