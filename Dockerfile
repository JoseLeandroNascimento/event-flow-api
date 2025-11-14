FROM alpine:latest

RUN apk add --no-cache curl unzip nginx bash tzdata ca-certificates

# Baixar PocketBase automaticamente
RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v0.22.11/pocketbase_0.22.11_linux_amd64.zip \
    && unzip pb.zip -d /app \
    && rm pb.zip \
    && chmod +x /app/pocketbase

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

CMD sh -c "/app/pocketbase serve --http=0.0.0.0:8090 & nginx -g 'daemon off;'"
