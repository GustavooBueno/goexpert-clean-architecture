#!/bin/bash
# wait-for-it.sh

wait_for_service() {
  local host="$1"
  local port="$2"
  
  echo "Waiting for $host:$port..."
  until nc -z -v -w30 "$host" "$port"; do
    echo "Waiting for $host:$port..."
    sleep 2
  done
  
  echo "$host:$port is available"
}

# Aguardar o PostgreSQL
wait_for_service "db" "5432"

# Aguardar o RabbitMQ
wait_for_service "rabbitmq" "5672"

echo "All services are available, executing command..."
exec "$@"
