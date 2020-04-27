FROM debian:10-slim

RUN apt-get update && \
    mkdir -p /usr/share/man/man1/ && \
    apt-get install --yes pdftk wget ca-certificates && \
    apt-get clean

WORKDIR /security-engineering-ebook

COPY . /security-engineering-ebook

ENTRYPOINT ["/security-engineering-ebook/generate.sh"]
