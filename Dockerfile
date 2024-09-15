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
    --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=target \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update \
    && apt-get install -y protobuf-compiler \
    && cargo build --release \
    && cp target/release/wavenet /usr/local/bin/

# Use a minimal Alpine image as the base image for the final image
FROM debian:bookworm-slim

# Set the working directory inside the container
WORKDIR /app

# Arguments
ENV POSTGRES_URL=${POSTGRES_URL}
ENV MEILISEARCH_API_URL=${MEILISEARCH_API_URL}
ENV MEILISEARCH_API_KEY=${MEILISEARCH_API_KEY}
ENV JWT_SECRET=${JWT_SECRET}

EXPOSE 3000
EXPOSE 50051
# Copy the built binary from the builder stage to the final image
# COPY --from=builder /app/target/release/wavenet .
COPY --from=builder /usr/local/bin/wavenet .

VOLUME ["/library","/images"]
# Set the entrypoint for the container
ENTRYPOINT ["./wavenet"]