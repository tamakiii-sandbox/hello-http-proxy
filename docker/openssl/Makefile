.PHONY: subject check

DAYS := 1

all: \
	secure/proxy.crt \
	secure/server.key \
	secure/server.key.pub

secure:
	mkdir $@

secure/proxy.key: secure
	openssl req -newkey rsa:2048 -nodes -subj '/C=US/O=Example Inc./CN=proxy.example.com' -keyout $@

secure/proxy.csr: secure secure/proxy.key
	openssl req -new -key secure/proxy.key -subj '/C=US/O=Example Inc./CN=proxy.example.com' > $@

secure/proxy.crt: secure secure/proxy.key secure/proxy.csr
	openssl x509 -req -in secure/proxy.csr -signkey secure/proxy.key -days $(DAYS) > $@

secure/server.key: secure
	openssl genrsa 2048 > $@

secure/server.key.pub: secure
	openssl rsa -in secure/server.key -pubout > $@

check:
	openssl req -text -noout -in secure/proxy.csr
	openssl x509 -text -noout -in secure/proxy.crt
	openssl rsa -noout -text -in secure/server.key
	cat secure/server.key.pub

subject:
	openssl x509 -in /etc/ssl/cert.pem -noout -subject
