FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache wget unzip

# Baixa a versão mais recente do PocketBase (linux amd64)
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.21.0/pocketbase_0.21.0_linux_amd64.zip \
    && unzip pocketbase_0.21.0_linux_amd64.zip \
    && chmod +x pocketbase \
    && rm pocketbase_0.21.0_linux_amd64.zip

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
