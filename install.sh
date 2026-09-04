#!/bin/bash
# Universal Nthgn Installer
set -e

echo "--- Nthgn Universal Setup ---"

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*|MINGW*|MSYS*) MACHINE=Windows;;
    *)          MACHINE="UNKNOWN"
esac

echo "Detected OS: $MACHINE"

# Check for Docker
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Please install Docker from https://www.docker.com/"
    exit 1
fi

echo "Building Nthgn Node..."
docker build -t nthgn-node .

# Run Node with custom port management
PORT=${1:-5000}
echo "Starting Nthgn Node on port $PORT..."
docker run -d --name nthgn-node -p $PORT:5000 nthgn-node

echo "Nthgn installed and running successfully!"
echo "Access the Node management dashboard at: http://localhost:$PORT"
