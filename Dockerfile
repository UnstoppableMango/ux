# syntax=docker/dockerfile:1
FROM golang:1.24@sha256:795a40cbe36a11e39b0709eb98d7aaa8d312d60336d863a0ef1c8aff07c1b3e0 AS base

ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

FROM base AS download
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download

FROM download AS build
WORKDIR /src
COPY cmd ./cmd
COPY gen ./gen
COPY pkg ./pkg
COPY main.go ./

RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o /out/ux

FROM --platform=$BUILDPLATFORM scratch
COPY --from=build /out/ux /usr/bin/
ENTRYPOINT [ "/usr/bin/ux" ]
