#!/bin/sh

# Default to 3128 if Render $PORT is not set locally
TARGET_PORT=${PORT:-3128}

# Replace placeholder with the actual Render port
sed -i "s/MY_RENDER_PORT/$TARGET_PORT/g" /etc/squid/squid.conf

# Start squid in the foreground
exec squid -N -f /etc/squid/squid.conf

