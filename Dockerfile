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

WORKDIR /app
ADD ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
ADD . /app

CMD ["python", "src/app.py"]
