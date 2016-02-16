FROM nginx:1.9
ADD nginx.conf.tpl /usr/src/
ENV UPSTREAM=${UPSTREAM:-localhost} SERVER_NAME=${SERVER_NAME:-"localhost"} LISTEN=${LISTEN:-"443 ssl"}
CMD envsubst '$UPSTREAM:$SERVER_NAME:$LISTEN' < /usr/src/nginx.conf.tpl > /etc/nginx/conf.d/default.conf & nginx -g 'daemon off;'
