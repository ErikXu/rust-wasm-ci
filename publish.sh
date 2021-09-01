#!/bin/bash

rm -rf ./publish
mkdir -p ./publish

rustup target add wasm32-wasi
cargo install wasm-gc

cargo build --target wasm32-wasi --release --target-dir ./publish

# 压缩 wasm
wasm-gc ./publish/wasm32-wasi/release/envoy_filter.wasm