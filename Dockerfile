FROM python:3-alpine

RUN apk add --no-cache wget ca-certificates && \
    pip install pystitcher

WORKDIR /security-engineering-ebook

COPY . /security-engineering-ebook

ENTRYPOINT ["/security-engineering-ebook/generate.sh"]
