FROM nextcloud:28.0.2-apache

RUN apt-get update && \
    apt-get install -y default-mysql-client redis-tools && \
    rm -rf /var/lib/apt/lists/*
