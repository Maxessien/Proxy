FROM alpine:latest

# Install squid
RUN apk update && apk add --no-cache squid

# Copy configuration and startup script
COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Fix file permissions for the squid user
RUN chmod +x /usr/local/bin/entrypoint.sh && \
    chown -R squid:squid /etc/squid /usr/local/bin/entrypoint.sh /var/run

# Switch to the non-root squid user context
USER squid

# Run the startup script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
