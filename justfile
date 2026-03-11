#!/usr/bin/env -S just --justfile

alias f := fmt
alias l := lint
alias c := comply
alias k := check
alias p := deploy

[doc('List available commands')]
_default:
    just --list --unsorted

[doc('Set up the repository')]
setup:
    cp -n _scripts/hooks/pre-commit .git/hooks/

[doc('Publish the binaries')]
deploy:
    just --justfile utils/snacks/justfile deploy
    dotter deploy

[doc('Comply, then check')]
qq: comply check

[doc('Enforce rules')]
comply: _update-example fmt lint
    just --justfile utils/snacks/justfile comply

[doc('Check rules')]
check: fmt-check lint
    just --justfile utils/snacks/justfile check

[doc('Format the codebase')]
fmt:
    dprint fmt
    stylua . --allow-hidden

[doc('Check if the codebase is properly formatted')]
fmt-check:
    dprint check
    stylua . --allow-hidden --check

[doc('Lint the codebase')]
lint: fmt-check
    typos
    selene . --quiet

[doc('Create a new release. Example: just release v2.2.0')]
release version:
    ./release {{ version }}

[doc('Check dependencies health. Pass `--write` to upgrade dependencies')]
up arg="":
    cargo upgrade --incompatible --recursive --verbose
    cargo update
    dprint config update

[doc('Keep example up-to-date.')]
_update-example:
    cp -f .dotter/local.toml .dotter/local.example.toml

[doc('Dependency analysis')]
meta:
    pnpx actions-up
    actionlint
