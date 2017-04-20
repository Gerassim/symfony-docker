FROM nginx:latest

ARG DOMAIN

COPY symfony3.conf /etc/nginx/conf.d/symfony3.conf.def

RUN echo "server {" > /etc/nginx/conf.d/symfony3.conf && \
    echo "    server_name $DOMAIN;" >> /etc/nginx/conf.d/symfony3.conf && \
    cat /etc/nginx/conf.d/symfony3.conf.def >> /etc/nginx/conf.d/symfony3.conf

RUN rm /etc/nginx/conf.d/symfony3.conf.def