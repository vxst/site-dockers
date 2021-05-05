FROM bitnami/nginx:1.19

WORKDIR /app
COPY html /app/
USER root
RUN find . -type f -exec sed -i "s/https:\/\/oi-wiki\.org\//\//g" {} \; ; \
    find . -type f -exec sed -i "s/https:\/\/oi-wiki\.org/\//g" {} \; ; \
    chown -R 1001:1001 .
USER 1001
