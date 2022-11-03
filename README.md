# Tic-Tac-Toe Backend

## Create Docker image

```bash
docker build -t tictactoe .
```

## Run Docker

```bash
docker run -d -p 127.0.0.1:5000:80/tcp tictactoe
```

```bash
dotnet run port 5000 --project ./src
```
