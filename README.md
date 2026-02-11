# WASM Hello World - Podman WASM OCIDemo

This directory contains a complete end-to-end demonstration of building, packaging, publishing, and deploying a WebAssembly application as an OCI.

## Files

- `src/main.rs` - Rust source code for WASM hello world application
- `Cargo.toml` - Rust project configuration
- `Containerfile` - OCI image definition for WASM binary

## Quick Start

See the complete walkthrough in the article: https://github.com/javatask/podman-wasm-oci-example/blob/main/tutorial.md

## Build Locally

```bash
# Install Rust WASI target
rustup target add wasm32-wasip1

# Build WASM binary
cargo build --target wasm32-wasip1 --release

# Output: target/wasm32-wasip1/release/wasm-hello.wasm (85 KB)
```

## Package as OCI Image

```bash
podman build --platform wasi/wasm \
  --annotation "module.wasm.image/variant=compat" \
  -t localhost/margo-wasm-hello:1.0 .
```
