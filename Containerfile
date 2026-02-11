FROM scratch
COPY target/wasm32-wasip1/release/wasm-hello.wasm /wasm-hello.wasm
ENTRYPOINT ["/wasm-hello.wasm"]
