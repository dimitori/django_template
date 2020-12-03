# pull official base image
FROM python:3.8.6-alpine

# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /usr/src/app/

# install pg libs and libs for pillow
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && apk del build-deps \
    && apk add build-base jpeg-dev zlib-dev


# install postgresql
RUN pip install psycopg2
RUN apk add --no-cache --update pgpool postgresql-client postgresql-contrib

RUN set -ex \
	\
	&& apk add --no-cache --virtual .fetch-deps \
		ca-certificates \
		openssl \
		tar

# install dependencies
RUN pip install --upgrade pip
RUN pip install --upgrade pipenv
COPY Pipfile* /usr/src/app/
RUN set -ex && \
    apk add --no-cache bash gcc musl-dev libffi-dev

RUN set -ex && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/cc1obj && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/lto1 && \
    rm -f /usr/libexec/gcc/x86_64-alpine-linux-musl/6.4.0/lto-wrapper && \
    rm -f /usr/bin/x86_64-alpine-linux-musl-gcj

RUN pip install python-telegram-bot
RUN apk --update --upgrade add gcc jpeg-dev zlib-dev cairo-dev pango-dev gdk-pixbuf-dev

RUN pipenv install --system --skip-lock

CMD ["bash"]
