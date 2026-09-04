#!/bin/bash
# Universal Installation for Nthgn
set -e
echo "Starting Nthgn Installation..."

# Install dependencies (Docker/Rust assumed for production)
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
fi

echo "Building Nthgn Node..."
docker build -t nthgn-node .

echo "Running Nthgn Node..."
docker run -d --name nthgn-node -p 8080:8080 nthgn-node

echo "Nthgn installed successfully!"
echo "Access the desktop UI in your browser or electron wrapper."
