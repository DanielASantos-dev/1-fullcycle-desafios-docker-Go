FROM golang:1.17 AS build

WORKDIR /app

COPY main.go ./
COPY go.mod ./

RUN go build -o /myappgo

FROM scratch

WORKDIR /

COPY --from=build /myappgo /myappgo

#USER nonroot:nonroot

ENTRYPOINT [ "/myappgo" ]