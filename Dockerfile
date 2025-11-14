FROM nluedtke/pocketbase:latest

EXPOSE 8090

CMD ["serve", "--http=0.0.0.0:8090"]
