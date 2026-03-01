# syntax=docker/dockerfile:1
FROM golang:1.26@sha256:9edf71320ef8a791c4c33ec79f90496d641f306a91fb112d3d060d5c1cee4e20 AS base

ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG VERSION=v0.0.1-docker
ARG LDFLAGS="-X github.com/unstoppablemango/ux/internal.Version=$VERSION"

FROM base AS download
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download

FROM download AS build
WORKDIR /src
COPY cmd ./cmd
COPY gen ./gen
COPY internal ./internal
COPY pkg ./pkg
COPY main.go ./

RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH \
	go build --ldflags="$LDFLAGS" -o /out/ux

FROM --platform=$BUILDPLATFORM scratch
COPY --from=build /out/ux /usr/bin/
ENTRYPOINT [ "/usr/bin/ux" ]
