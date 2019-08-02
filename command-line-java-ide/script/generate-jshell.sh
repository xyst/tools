#!/bin/bash
set -euo pipefail

# Source: https://stackoverflow.com/questions/59895
here=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Assume: packages names contains no symbols
generate() {
  to=$1
  {
    echo '#!/bin/bash'
    echo 'set -euo pipefail'
    # Workaround nonexistent directory in the listed class path
    echo "mkdir -p \"$here/../build/resources/main\""
    echo -n "$to --class-path "
    ./gradlew --quiet classPath
    echo ' "$@"'
  } >"$here/$to.sh"
  chmod u+x "$here/$to.sh"
}

generate jshell
