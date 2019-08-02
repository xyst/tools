#!/bin/bash
set -euo pipefail

# Example:
# script/extract-sources-and-javadoc.sh com.google.guava:guava:27.0.1-jre

# Source: https://stackoverflow.com/questions/59895
base=$(cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd)

from="$HOME/.gradle/caches/modules-2/files-2.1"
to="$base/link"

miss=

extract() {
  # javadoc group:artifact:version
  local type=$1

  local group=${2%%:*}
  local artifact=${2%:*}
  artifact=${artifact#*:}
  local version=${2##*:}

  local prefix=$from/$group
  local suffix=$artifact-$version-$type.jar
  for i in "$prefix/$artifact/$version/"*"/$suffix"; do
    local dir=${i#$prefix/}
    dir=${dir%/$suffix}
    dir=${dir//\//-}
    dir=$to/$type/$dir
    if [[ -e "$i" ]]; then
      mkdir -p "$dir"
      (cd "$dir" && jar xf "$i")
    else
      echo "I see no ...$suffix"
      miss=yes
    fi
  done
}

update() {
  if command -v global >/dev/null; then global --update; fi
}

extract javadoc "$@"
extract sources "$@" && update
[[ -n $miss ]] && echo 'Did you run "./gradlew idea"?'
