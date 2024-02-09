FROM golang:1.21 AS builder

WORKDIR /usr/src/app

RUN go mod init hello/hello


COPY hello.go .

RUN go build

FROM hello-world
COPY --from=builder /usr/src/app/hello .
ENTRYPOINT ["./hello"]
