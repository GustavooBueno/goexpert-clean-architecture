FROM golang:1.22-alpine

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Instalar bash (necessário para o wait-for-it.sh)
RUN apk add --no-cache bash

# Copiar e configurar wait-for-it.sh
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Build da aplicação
RUN go build -o goexpert-clean-architecture cmd/main.go

EXPOSE 8080
EXPOSE 8000
EXPOSE 50051

# Comando para aguardar os serviços e então iniciar a aplicação
CMD ["/wait-for-it.sh", "./goexpert-clean-architecture"]
