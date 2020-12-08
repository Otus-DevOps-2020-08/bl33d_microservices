FROM ubuntu:18.04

COPY reddit /reddit
COPY docker-monolith/mongod.conf /etc/mongod.conf
COPY docker-monolith/db_config /reddit/db_config
COPY docker-monolith/start.sh /start.sh

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    mongodb-server \
    ruby-dev \
    ruby && \
    gem install bundler && \
    cd /reddit && rm Gemfile.lock && bundle install && \
    chmod 0777 /start.sh && \
    apt-get purge --auto-remove -y build-essential ruby-dev \
&&  rm -rf /var/lib/apt/lists/*

CMD ["/start.sh"]
