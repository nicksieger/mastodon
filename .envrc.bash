#!/usr/bin/env bash

export DEV_ALIASES=1
source .envrc

_compose_wrap() {
    docker compose exec -it app "$@"
}

_aliases=()
envrc_clear() {
    for a in ${_aliases[*]}; do
        unalias $a
    done
}

for script in bin/*; do
    aliases+=($(basename $script))
    eval "alias $(basename $script)='_compose_wrap $script'"
done
