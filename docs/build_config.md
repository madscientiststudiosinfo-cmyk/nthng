# Cross-Platform Build Configuration

- **Windows:** Use `cargo build --target x86_64-pc-windows-msvc` for Windows binary generation.
- **macOS:** Use `cargo build --target x86_64-apple-darwin` or `aarch64-apple-darwin`.
- **Linux:** Use `cargo build --target x86_64-unknown-linux-gnu`.

All targets ensure binary portability for the core messaging node.
