# syntax=docker/dockerfile:1
FROM golang:1.24@sha256:1bcf8844d2464a6485c87646f9da684610758eb1a2df63c8a6e7ca47c64f8655 AS base

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
