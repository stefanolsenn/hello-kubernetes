FROM golang:alpine AS build
RUN apk add git
ADD . /go/src/github.com/stefanolsenn/hello-kubernetes
WORKDIR /go/src/github.com/stefanolsenn/hello-kubernetes

#disable crosscompiling 
ENV CGO_ENABLED=0
#compile linux only
ENV GOOS=linux

#build the binary with debug information removed
RUN go get -d -v
RUN go build -ldflags '-w -s' -a -installsuffix cgo -o /go/bin/github.com/stefanolsenn/hello-kubernetes

FROM scratch
COPY --from=build /go/bin/github.com/stefanolsenn/hello-kubernetes /go/bin/github.com/stefanolsenn/hello-kubernetes
EXPOSE 9000
ENTRYPOINT ["/go/bin/github.com/stefanolsenn/hello-kubernetes"]
