FROM golang:1.17 as builder

# first (build) stage

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o server main.go

# final (target) stage

FROM alpine:3.10
COPY --from=builder /app/server .
CMD ["/server"]