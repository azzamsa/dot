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
  # core
  starship
  atuin
  eza
  zoxide
  dotter
  nu
  zellij

  # dailies
  bat
  yazi-fm
  just
  git-cliff
  hurl
  jj-cli
  typos-cli
  fd-find

  # Utils
  fnm
  kondo
  bandwhich
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
  bob
  goup
  stylua
  selene
  trunk
  hurlfmt

  # Rust ecosystem tools
  bacon
  diesel_cli
  dioxus-cli
  cargo-audit
  cargo-cache
  cargo-deny
  cargo-edit
  cargo-generate
  cargo-nextest
  cargo-outdated
  cargo-release
  cargo-sort
  cargo-tarpaulin
  cargo-udeps
  cargo-update

  # lsp
  beancount-language-server
  emacs-lsp-booster
)

for pkg in "${pkgs[@]}"; do
    cargo binstall --no-confirm --no-symlinks --secure "$pkg"
done

# Optionals
# cargo install --locked cargo-nextest
