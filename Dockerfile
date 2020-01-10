#Builder
FROM golang:1.12.14 as Builder

WORKDIR /opt/MQTT-client
COPY . .

RUN go build -mod=vendor -tags netgo


#Execute
FROM alpine:latest

WORKDIR /opt/MQTT-client
COPY --from=Builder /opt/MQTT-client .

ENTRYPOINT ["./MQTT-client"]