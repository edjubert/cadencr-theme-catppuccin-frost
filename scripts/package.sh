#!/bin/sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
output=${1:-"$root/dist"}
cli=${CADENCR_CLI:-cadencr}
version=0.1.0

mkdir -p "$output"
output=$(CDPATH= cd -- "$output" && pwd -P)

for variant in mocha latte; do
  "$cli" plugin validate "$root/themes/$variant" --kind theme
  "$cli" registry pack-theme \
    --directory "$root/themes/$variant" \
    --output "$output/catppuccin-frost-$variant-$version.tar.gz"
done
