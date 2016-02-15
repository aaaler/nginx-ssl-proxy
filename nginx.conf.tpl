  upstream upstreams {
    server ${UPSTREAM};
  }

  server {
    listen ${LISTEN};
    server_name ${SERVER_NAME};

    ssl on;
    ssl_certificate /ssl/cert;
    ssl_certificate_key /ssl/key;

    proxy_set_header Host       $http_host;   # required for Docker client sake
    proxy_set_header X-Real-IP  $remote_addr; # pass on real client IP

    client_max_body_size 0; # disable any limits to avoid HTTP 413 for large image uploads

    # required to avoid HTTP 411: see Issue #1486 (https://github.com/dotcloud/docker/issues/1486)
    chunked_transfer_encoding on;

    location / {
      proxy_pass http://upstreams;
    }
  }

