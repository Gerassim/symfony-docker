FROM nginx:latest

ARG DOMAIN

COPY symfony3.conf /etc/nginx/conf.d/symfony3.conf.def
#COPY symfony3.conf /etc/nginx/conf.d/symfony3.conf

RUN echo "server {" > /etc/nginx/conf.d/symfony3.conf
RUN echo "    server_name $DOMAIN;" >> /etc/nginx/conf.d/symfony3.conf
RUN cat /etc/nginx/conf.d/symfony3.conf.def >> /etc/nginx/conf.d/symfony3.conf