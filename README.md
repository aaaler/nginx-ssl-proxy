nginx-ssl-proxy
===============

Simple nginx microservice proxing https request to https service.

Example usage:
```
docker run -d -p 10.10.10.10:443:443 \
  -e UPSTREAM="192.168.0.10:5010" \
  -v /etc/nginx/ssl/core.tf.crt:/ssl/cert \
  -v /etc/nginx/ssl/core.tf.key:/ssl/key \
  aaaler/nginx-ssl-proxy
```
This example runs https proxy listening on https://10.10.10.10:443 and proxing requests to http://192.168.0.10:5010

You can use this self-explaining environment variables:
 - `UPSTREAM` -- define nginx upstream. Defaults to localhost.
 - `SERVER_NAME` -- nginx server_name. Defaults to localhost.
 - `LISTEN` -- nginx listen directive. Defaults to "443 ssl".

[Automated build on dockerhub](https://hub.docker.com/r/aaaler/nginx-ssl-proxy/)

