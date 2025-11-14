# Build PocketBase image
FROM alpine:latest

# Install CURL & NGINX
RUN apk add --no-cache curl nginx

# Copy PocketBase binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose HTTP port
EXPOSE 8080

# Start NGINX + PocketBase
CMD sh -c "/app/pocketbase serve --http=127.0.0.1:8090 & nginx -g 'daemon off;'"
