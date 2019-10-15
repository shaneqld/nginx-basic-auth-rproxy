# Reverse Proxy with Basic Auth

This is a very simple example of an nginx reverse proxy that adds basic authentication.

This example exposes HTTP on default port 8080.

## Configuration

You must configure the following environment variables:

Environment variable | Example | Description
--|--
PROXY_TARGET | http://10.1.20.210/ | The address where all requests will be proxied to.
PROXY_PORT | 8080 | The port to listen on. Default is 8080.
BASIC_USERNAME | my-username | The username for basic auth.
BASIC_PASSWORD | my-password | The password for basic auth.
