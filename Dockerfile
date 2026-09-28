# syntax=docker/dockerfile:1
FROM golang:1.27@sha256:3680233e3204827fbdc66088528ae6d4b3d034f51d03a99d454f6de034888244 AS base

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
