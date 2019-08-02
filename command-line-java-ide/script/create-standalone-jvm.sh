#!/bin/bash
set -euo pipefail

# Source: https://stackoverflow.com/questions/59895
base=$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd)

askToDelete() {
  local dir=$1
  mkdir -p "$(dirname "$dir")"
  if [[ -e "$dir" ]]; then
    while true; do
      read -r -n 1 -p 'Directory already exists, delete? (Y/n)' yn
      case "$yn" in
        n|N) exit ;;
        y|Y|'') break ;;
      esac
    done
    rm -f -r "$dir"
  fi
}

output=${1:-$base/link/jvm}
echo "Creating standalone JVM in ${output#$(pwd)/}"
askToDelete "$output"

jlink --module-path /usr/lib/jvm/java-11-openjdk-amd64/jmods \
  --add-modules java.base --output "$output"

# Reduce the size by 400 MB
# Source: https://github.com/docker-library/openjdk/issues/217#issuecomment-430380403
strip --preserve-dates --strip-unneeded "$output"/lib/server/libjvm.so
