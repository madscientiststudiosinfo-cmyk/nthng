#!/bin/bash
# Nthgn System Dependency Checker & Installer
set -e

echo "--- Nthgn Dependency Check ---"

# Detect OS
OS="$(uname -s)"
echo "Detected OS: $OS"

# Check for Docker
if ! command -v docker &> /dev/null; then
    echo "Docker not installed. Attempting installation..."
    if [[ "$OS" == "Linux" ]]; then
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
    else
        echo "Please install Docker manually from https://www.docker.com/"
        exit 1
    fi
else
    echo "Docker is installed."
fi

# Clone and build if necessary (run from project folder)
echo "Ensuring project environment..."
if [ ! -f "Dockerfile" ]; then
    echo "Cloning latest Nthgn..."
    git clone https://github.com/madscientiststudiosinfo-cmyk/nthng.git nthgn-temp
    cd nthgn-temp
fi

echo "Building node..."
docker build -t nthgn-node .

echo "--- Nthgn Setup Complete ---"
echo "Use './scripts/install_server.sh {private|public}' to start the server."
