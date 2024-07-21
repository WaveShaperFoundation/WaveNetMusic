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

# Copy mod.rs
COPY mod.rs ./mod.rs

# Install protobuf
RUN apt-get update && apt-get install -y protobuf-compiler

# Build the application
RUN cargo build --release

# Use a minimal Alpine image as the base image for the final image
FROM debian:bookworm-slim

# Set the working directory inside the container
WORKDIR /app

# Arguments
ARG POSTGRES_URL="postgres://admin:admin@localhost/wavenet"
ARG GRPC_PORT="50051"
ARG WEB_PORT="3000"
ARG MEILISEARCH_URL="http://localhost:7700"
ARG MEILISEARCH_KEY="masterKey"

EXPOSE 3000
# Copy the built binary from the builder stage to the final image
COPY --from=builder /app/target/release/wavenet .

VOLUME ["/library"]
# Set the entrypoint for the container
ENTRYPOINT ["./wavenet"]