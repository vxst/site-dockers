FROM bitnami/nginx:1.19

WORKDIR /app
COPY html /app/
RUN find . -type f -exec sed -i "s/https:\/\/oi-wiki\.org\//\//g" {} \;
