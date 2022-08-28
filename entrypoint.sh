#!/usr/bin/env bash

set -euo pipefail

_template() {
  request_uri="\$request_uri" envsubst < "$1"
}

_replace_default_conf() {
  _template "$@" > "$__default_conf_file"
  >&2 cat "$__default_conf_file"
}

_ensure_port() {
  export PORT="${PORT:-80}"
  >&2 echo "PORT: $PORT"
}

# ---

__default_conf_file='/etc/nginx/conf.d/default.conf'

_ensure_port

_replace_default_conf ./nginx.conf

/docker-entrypoint.sh "$@"
