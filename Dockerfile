FROM python:3.8-alpine

COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN apk add --no-cache jpeg-dev zlib-dev && \
    apk add --no-cache mariadb-dev g++ && \
    apk add --no-cache --virtual .build-deps build-base linux-headers && \
    pip install --no-cache-dir -r /tmp/requirements.txt && \
    apk del g++ mariadb-dev && \
    apk del .build-deps && \
    apk add --no-cache mariadb-client mariadb-connector-c-dev tzdata
ENV TZ Asia/Tehran


CMD ["/bin/sh"]
