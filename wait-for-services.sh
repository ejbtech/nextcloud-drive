#!/bin/bash
set -e

echo "Waiting for DNS resolution of db..."

until getent hosts db; do
  echo "Host db not yet resolvable - sleeping"
  sleep 2
done

echo "Host db resolves!"
echo "Waiting for MariaDB to be ready..."

while true; do
  if mysql -h db -unextcloud -pnextcloudpass -e "SELECT 1;" ; then
    echo "MariaDB is up."
    break
  else
    echo "MariaDB unavailable - sleeping. Retrying in 5s..."
  fi
  sleep 5
done

echo "Waiting for DNS resolution of redis..."

until getent hosts redis; do
  echo "Host redis not yet resolvable - sleeping"
  sleep 2
done

echo "Host redis resolves!"
echo "Waiting for Redis to be ready..."

until redis-cli -h redis ping | grep PONG &>/dev/null; do
  echo "Redis unavailable - sleeping"
  sleep 5
done

echo "Redis is up."

# Here's the magic fix:
echo "Calling Nextcloud's official entrypoint..."
exec /entrypoint.sh apache2-foreground
