FROM alpine:3.12

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/

RUN apk --no-cache --update add \
    build-base \
    ruby-dev \
    ruby-full \
    && gem install bundler:1.17.2 --no-document \
    && bundle install \
    && apk del --no-cache ruby-dev build-base

COPY . $APP_HOME

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
