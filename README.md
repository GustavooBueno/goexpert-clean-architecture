# Clean Architecture + API + GraphQL + gRPC

## Como executar?

1. Clone esse repositório:
   ```sh
   git clone git@github.com:GustavooBueno/goexpert-clean-architecture.git
    ```
2. Abra um terminal na raiz do projeto.
3. Rode o comando para iniciar o arquivo do docker-compose:
   ```sh
   docker-compose build
   ```
4. Execute o comando para iniciar a aplicação
   ```sh
   docker-compose up
   ```
   
###  API HTTP

- **Gerar um pedido novo:**

  ```sh
  curl --location 'http://localhost:8000/order' \
  --header 'Content-Type: application/json' \
  --data '{
      "id": "10",
      "price": 60.5,
      "tax": 0.21
  }'
  ```

- **Listar pedidos:**

  ```sh
  curl --location 'http://localhost:8000/order'
  ```


###  GraphQL

- **Criar pedido:**

  ```sh
    curl -X POST http://localhost:8080/query \
     -H "Content-Type: application/json" \
     -d '{"query": "mutation { createOrder(input: {id: \"123\", Price: 100.50, Tax: 0.15}) { id Price Tax FinalPrice } }"}'
  ```

- **Listar pedidos:**
  
```sh
  curl -X POST http://localhost:8080/query \
  -H "Content-Type: application/json" \
  -d '{"query": "query { listOrders { id Price Tax FinalPrice } }"}'
 ```

### GRPC 

**Criar pedido:**

    grpcurl -plaintext -d '{"id":"6","price": 120.2, "tax": 0.6}' localhost:50051 pb.OrderService/CreateOrder


**Listar pedidos:**

    grpcurl -plaintext -d '{}' localhost:50051 pb.OrderService/ListOrders
      
