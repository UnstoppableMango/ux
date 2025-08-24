# syntax=docker/dockerfile:1
FROM golang:1.25@sha256:4859242e2c392ddc9d3225fd41181c00a443d9cc005b8e5131ce164106fbc676 AS base

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
