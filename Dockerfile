FROM debian:buster

RUN apt-get update \
    && apt-get install -y --no-install-recommends

RUN apt-get install gnupg wget -y

RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -

RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -

RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list

RUN apt-get update

RUN apt-get install -y mongodb-org

WORKDIR /usr/local/workdir

COPY . .