#!/usr/bin/env -S just --justfile

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

[doc('Exhaustive quality check')]
qqq: qa _lint-nu meta

[doc('Quality check')]
qq: qa

[doc('Quick quality check')]
qa: fmt-check lint
    just --justfile utils/snacks/justfile qa

[doc('Fix before check')]
qc: fix qq

[doc('Enforce rules')]
fix: fmt lint
    just --justfile utils/snacks/justfile fix

[doc('Format')]
fmt:
    dprint fmt
    stylua . --allow-hidden

[doc('Check formatting')]
fmt-check:
    dprint check
    stylua . --allow-hidden --check

[doc('Lint')]
lint: fmt-check
    typos
    selene . --quiet

[doc('Lint Nushell code')]
_lint-nu:
    nu-lint bin/ --fix

[doc('Create a new release. Example: just release v2.2.0')]
release version:
    ./release {{ version }}

[doc('Upgrade dependencies')]
up:
    dprint config update

[doc('Keep example up-to-date.')]
_update-example:
    cp -f .dotter/local.toml .dotter/local.example.toml

[doc('Dependency analysis')]
meta:
    pnpx actions-up
    actionlint
