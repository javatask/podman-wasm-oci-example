#!/bin/bash
# Resource measurement script for WASM Quadlet demo
# Run this on the EC2 instance after deploying the Quadlet

set -e

echo "======================================"
echo "Margo WASM Demo - Resource Measurements"
echo "======================================"
echo

echo "1. Service Status:"
echo "-------------------"
systemctl --user status wasm-hello --no-pager || echo "Service not running"
echo

echo "2. Memory Metrics:"
echo "-------------------"
systemctl --user show wasm-hello | grep -E "Memory(Current|Max|Available|High)" || echo "No memory data"
echo

echo "3. CPU Metrics:"
echo "-------------------"
systemctl --user show wasm-hello | grep -E "CPU(Quota|Usage|Weight)" || echo "No CPU data"
echo

echo "4. Container Images:"
echo "-------------------"
podman images | grep -E "(REPOSITORY|margo-wasm)"
echo

echo "5. System Memory (free -h):"
echo "-------------------"
free -h
echo

echo "6. Service Logs (last 20 lines):"
echo "-------------------"
journalctl --user -u wasm-hello -n 20 --no-pager || echo "No logs available"
echo

echo "======================================"
echo "Measurements complete!"
echo "======================================"
