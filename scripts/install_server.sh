#!/bin/bash
# Nthgn Server Installer
set -e

echo "--- Nthgn Server Setup ---"

if ! command -v docker &> /dev/null; then
    echo "Docker not found. Please install it first."
    exit 1
fi

docker build -t nthgn-node .

function start_private() {
    echo "Starting PRIVATE node (local access only)..."
    docker run -d --name nthgn-private -p 127.0.0.1:5000:5000 nthgn-node
}

function start_public() {
    echo "Starting PUBLIC node (accessible on network)..."
    docker run -d --name nthgn-public -p 0.0.0.0:5000:5000 nthgn-node
}

case "$1" in
    private) start_private ;;
    public) start_public ;;
    *) echo "Usage: $0 {private|public}" ;;
esac
