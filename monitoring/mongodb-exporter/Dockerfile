FROM alpine:3.12 as build

ENV MONGODB_GITHUB_URL https://github.com/percona/mongodb_exporter/releases/download/v0.20.1/mongodb_exporter-0.20.1.linux-amd64.tar.gz

RUN apk --no-cache --update add \
    curl

RUN curl $MONGODB_GITHUB_URL -L -o mongodb_exporter.tar.gz \
    && tar xzf mongodb_exporter.tar.gz

FROM scratch
COPY --from=build mongodb_exporter /bin/

ENTRYPOINT [ "mongodb_exporter" ]
