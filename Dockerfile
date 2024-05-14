FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY golang/main.go .

RUN go mod init full-cycle-rocks

RUN go build -o full-cycle-rocks

FROM scratch

WORKDIR /app

COPY --from=builder app/full-cycle-rocks .

CMD ["./full-cycle-rocks"]