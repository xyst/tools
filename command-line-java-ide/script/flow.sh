#!/bin/bash
set -euo pipefail

compile() {
  if ./gradlew compileTestJava 2>&1 | tee compile.log; then
    if [[ -e GTAGS ]]; then
      global --update
    else
      gtags
    fi
  else
    vi compile.log || true
  fi
}

report() {
  for i in build/reports/tests/test/index.html build/reports/spotbugs/*.html; do
    w3m -dump "$i" > "$i.txt" || true
  done
  vi -p build/reports/tests/test/*.txt build/reports/spotbugs/*.txt || true
}

edit() {
  vi . || true
}

compile

prompt='gradle: [c]ompileTestJava, [r]un, spotless[A]pply, [b]uild. [R]eports. [v]im. [V]iew in ranger. tig s[t]atus. git rebase -i HEAD~[2]. '

while true; do
  read -r -p "$prompt" -n 1 key
  echo
  case "$key" in
    c) compile ;;
    r) ./gradlew run || true ;;
    A) ./gradlew spotlessApply || true ;;
    b) global --update || true
       ./gradlew build || true ;;
    t) tig status || true ;;
    q) exit ;;
    2) git rebase -i HEAD~2 || true ;;
    3) git rebase -i HEAD~3 || true ;;
    R) report ;;
    v) edit || true ;;
    V) ranger || true ;;
    *) [[ $key = '' ]] && compile ;;
  esac
done
