FROM bitnami/nginx:1.19

WORKDIR /app
COPY ./html/* .

RUN find . -type f ! -name '*.gz' -exec gzip -9 -k {} \;
