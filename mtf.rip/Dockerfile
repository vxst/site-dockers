FROM bitnami/nginx:1.19

USER root
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get clean
USER 1001
WORKDIR /app
COPY ./html/* .
