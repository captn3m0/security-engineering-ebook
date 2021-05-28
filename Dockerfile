FROM python:3-alpine

RUN apt-get update && \
    mkdir -p /usr/share/man/man1/ && \
    apt-get install --yes wget ca-certificates && \
    pip install pystitcher && \
    apt-get clean

WORKDIR /security-engineering-ebook

COPY . /security-engineering-ebook

ENTRYPOINT ["/security-engineering-ebook/generate.sh"]
