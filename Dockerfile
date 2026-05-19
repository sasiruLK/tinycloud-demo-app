FROM golang:1.23-alpine AS builder

WORKDIR /app
COPY main.go .

RUN go mod init tinycloud-demo-app
RUN go build -o server main.go

FROM alpine:3.20

WORKDIR /app
COPY --from=builder /app/server .

EXPOSE 8080

CMD ["./server"]
