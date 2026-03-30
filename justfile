#!/usr/bin/env -S just --justfile

alias f := fmt
alias l := lint
alias p := deploy

[doc('List available commands')]
_default:
    just --list --unsorted

[doc('Set up the repository')]
setup:
    cp -f .scripts/hooks/pre-commit .git/hooks/

[doc('Publish the binaries')]
deploy:
    just --justfile utils/snacks/justfile deploy
    dotter deploy

[doc('Complete quality check')]
qq: qa _lint-nu meta

[doc('Quick quality check')]
qa: fmt-check lint
    just --justfile utils/snacks/justfile check

[doc('Enforce rules')]
fix: _update-example fmt lint
    just --justfile utils/snacks/justfile comply

[doc('Format the codebase')]
fmt:
    dprint fmt
    stylua . --allow-hidden

[doc('Check if the codebase is properly formatted')]
fmt-check:
    dprint check
    stylua . --allow-hidden --check

[doc('Lint the codebase')]
lint: fmt-check _lint-nu
    typos
    selene . --quiet

[doc('Lint the Nushell codebase.')]
_lint-nu:
    nu-lint bin/ --fix

[doc('Create a new release. Example: just release v2.2.0')]
release version:
    ./release {{ version }}

[doc('Check dependencies health. Pass `--write` to upgrade dependencies')]
up:
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
