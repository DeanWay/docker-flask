FROM python:3.7-alpine

# install alpine python mysql dependencies
RUN apk --no-cache add --virtual build-dependencies \
      build-base \
      py-mysqldb \
      gcc \
      libc-dev \
      libffi-dev \
      mariadb-dev \
      && pip install mysqlclient \
      && apk del build-dependencies

# mysql dependencies above are deleted after `pip install mysqlclient`
# add mariadb-client-libs to continue support for client connections, minimizing image size
RUN apk -q --no-cache add mariadb-client-libs

# install bash
RUN apk add --update bash && rm -rf /var/cache/apk/*
# install make
RUN apk add --update make

WORKDIR /app
ADD ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# add scripts
COPY scripts/flask.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/flask.sh && ln -s /usr/local/bin/flask.sh /

ADD . /app

CMD ["/flask.sh"]
