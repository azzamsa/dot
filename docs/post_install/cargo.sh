#!/usr/bin/env bash

#
# Setup Rust
#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
rustup component add rust-analyzer
source "$CARGO_HOME/env"

#
# Cargo
#
cargo install cargo-binstall

pkgs=(
    cargo-audit cargo-binstall cargo-cache cargo-deny cargo-edit cargo-generate cargo-nextest cargo-outdated cargo-release cargo-sort cargo-tarpaulin cargo-udeps cargo-update
)

for pkg in "${pkgs[@]}"; do
    cargo binstall --no-confirm --no-symlinks --secure "$pkg"
done

# Optionals
# cargo install --locked cargo-nextest
