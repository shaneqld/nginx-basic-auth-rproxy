FROM nginx

# Set default port
ENV PROXY_PORT=8080

# Install apache2-utils (used for generating .htpasswd file)
RUN apt-get update && apt-get install -y apache2-utils

# Remove the default configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy in config as template
COPY reverse_proxy.conf /etc/nginx/conf.d/reverse_proxy.conf.template

# Copy startup script
WORKDIR /app
COPY start.sh .
RUN chmod +x start.sh

# Entrypoint: substitute environment variables in template config, generate htpasswd file and run nginx
ENTRYPOINT [ "/app/start.sh" ]
