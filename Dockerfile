FROM golang:1.24.2-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

COPY main.go ./

RUN CGO_ENABLED=0 go build -o /main main.go

FROM alpine:latest

COPY --from=builder /main /main

EXPOSE 8080

CMD ["/main"]