#!/usr/bin/env bash

#
# Setup Rust
#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
rustup component add rust-analyzer
# shellcheck source=/dev/null
source "$CARGO_HOME/env"

#
# Cargo
#
cargo install cargo-binstall

pkgs=(
  # core
  dotter
  nu

  # Utils
  jj-cli
  kondo
  bottom
  dua-cli
  hyperfine
  jaq
  resvg
  sd
  tokei
  typst-cli
  typstyle
  watchexec-cli
  mdfried
  ttyper
  goup

  # lsp
  beancount-language-server
  emacs-lsp-booster
)

for pkg in "${pkgs[@]}"; do
    cargo binstall --no-confirm --no-symlinks --secure "$pkg"
done
