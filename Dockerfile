# Use a multi-stage build for a smaller, secure image
FROM rust:1.75-slim AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/target/release/nthgn-core .
# Expose port 5000 for the management dashboard
EXPOSE 5000
CMD ["./nthgn-core"]
