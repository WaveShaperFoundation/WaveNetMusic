# Use the official Rust image as the base image
FROM rust:latest as builder

# Set the working directory inside the container
WORKDIR /app

# Argument for postgreqsl
ARG POSTGRES_URL="postgres://admin:admin@localhost/wavenet"

# Copy the Cargo.toml and Cargo.lock files to the container
COPY Cargo.toml Cargo.lock ./

# Copy the source code to the container
COPY src ./src

# Copy the migrations
COPY migration ./migration

# Copy entity files
COPY entity ./entity

# Copy proto files
COPY proto ./proto

# Copy build.rs
COPY build.rs ./build.rs

# Install protobuf
# RUN apt-get update && apt-get install -y protobuf-compiler
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update \
    && apt-get install -y protobuf-compiler

# Build the application
RUN --mount=type=cache,target=/usr/local/cargo,from=rust:latest,source=/usr/local/cargo \
        --mount=type=cache,target=target \
        cargo build --release

# Use a minimal Alpine image as the base image for the final image
FROM debian:bookworm-slim

# Set the working directory inside the container
WORKDIR /app

# Arguments
ENV POSTGRES_URL=${POSTGRES_URL}
ENV GRPC_PORT=${GRPC_PORT}
ENV WEB_PORT=${WEB_PORT}
ENV MEILISEARCH_URL=${MEILISEARCH_URL}
ENV MEILISEARCH_KEY=${MEILISEARCH_KEY}

EXPOSE 3000
# Copy the built binary from the builder stage to the final image
COPY --from=builder /app/target/release/wavenet .

VOLUME ["/library"]
# Set the entrypoint for the container
ENTRYPOINT ["./wavenet"]