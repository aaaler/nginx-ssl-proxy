FROM nginx:1.9

WORKDIR /usr/src

ADD . /usr/src/

CMD envsubst '$UPSTREAM:$SERVER_NAME' < /usr/src/nginx.conf.tpl > /etc/nginx/conf.d/default.conf & nginx -g 'daemon off;'

