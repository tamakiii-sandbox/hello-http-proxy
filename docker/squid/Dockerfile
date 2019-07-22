FROM alpine:3.10.1

RUN apk add --no-cache squid openssl

RUN mkdir -p /var/cache/squid && \
    /usr/lib/squid/security_file_certgen -c -s /var/cache/squid/ssl_db -M 4MB && \
    chown -R squid:squid /var/cache/squid

ENTRYPOINT ["squid"]
