#! /bin/bash

if command -v podman &>/dev/null; then
  runner=podman
elif command -v docker &>/dev/null; then
  runner=docker
else
  echo "Either docker or podman must be installed for tests to run"
  exit 1
fi

watchexec \
  --watch . \
  --clear \
  --ignore 'tests/**/diff/**' \
  --ignore 'tests/**/out/**' \
  "$runner run -v $(pwd):/data ghcr.io/typst-community/tytanic r --root /data"
