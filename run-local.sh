#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v docker >/dev/null 2>&1; then
  printf 'Docker is required. Install Docker, then run this script again.\n' >&2
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  printf 'Cannot access the Docker daemon. Start Docker and ensure your account can use it.\n' >&2
  printf 'On Linux: sudo usermod -aG docker "$USER", then open a new shell.\n' >&2
  exit 1
fi

exec docker run --rm -it \
  -p 4000:4000 \
  -p 35729:35729 \
  -v "${repo_root}:/site" \
  -v jekyll-bundle-cache:/usr/local/bundle \
  -w /site \
  ruby:2.7 \
  bash -lc 'gem install bundler -v 1.17.3 --no-document && bundle _1.17.3_ install && bundle _1.17.3_ exec jekyll serve --host 0.0.0.0 --livereload'
