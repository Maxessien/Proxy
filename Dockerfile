FROM alpine:latest

# Install squid
RUN apk update && apk add --no-cache squid

# Copy configuration and startup script
COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Run the startup script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

