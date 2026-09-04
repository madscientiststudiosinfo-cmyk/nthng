#!/bin/bash
# Installation script for Linux
echo "Installing TextingApp Server..."
# Install dependencies (Rust/Cargo)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo build --release
sudo cp target/release/textingapp-core /usr/local/bin/textingapp-server
echo "Installation complete."
