use std::thread;
use std::time::Duration;

fn main() {
    println!("🦭 Margo WASM Demo - Hello from WebAssembly!");
    println!("========================================");
    println!("Runtime: wasm32-wasi");
    println!("Build: Rust {} ({})", env!("CARGO_PKG_VERSION"), env!("CARGO_PKG_NAME"));
    println!();

    // Simulate periodic sensor output (for demo purposes)
    for i in 1..=5 {
        println!("[{}] Sensor reading: temperature={}°C, timestamp={}",
                 i,
                 20 + (i * 3),
                 std::time::SystemTime::now()
                     .duration_since(std::time::UNIX_EPOCH)
                     .unwrap()
                     .as_secs());
        thread::sleep(Duration::from_secs(2));
    }

    println!();
    println!("✓ WASM workload completed successfully");
    println!("Memory footprint: <10 MB (WASM sandbox)");
}
