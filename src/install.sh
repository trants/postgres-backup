#! /bin/sh

set -eux
set -o pipefail

apk update

# Install pg_dump
apk add postgresql-client

# Install gpg
apk add gnupg

apk add python3
apk add py3-pip
pip3 install awscli --break-system-packages

# Install go-cron
apk add curl
curl -L https://github.com/ivoronin/go-cron/releases/download/v0.0.5/go-cron_0.0.5_linux_${TARGETARCH}.tar.gz -O
tar xvf go-cron_0.0.5_linux_${TARGETARCH}.tar.gz
rm go-cron_0.0.5_linux_${TARGETARCH}.tar.gz
mv go-cron /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl

# Cleanup
rm -rf /var/cache/apk/*
