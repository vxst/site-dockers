FROM httpd:alpine
RUN apk -U upgrade
COPY ./html/ /usr/local/apache2/htdocs/
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
EXPOSE 8086
