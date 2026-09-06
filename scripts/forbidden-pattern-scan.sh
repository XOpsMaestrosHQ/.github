#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
cd "$ROOT"

FAILED=0

echo "[1/3] Checking for suspiciously long lines in config files..."
while IFS= read -r file; do
  awk -v f="$file" 'length > 200 {
    print "FAIL [long-line] " f ":" NR " (" length " chars)"
    exit 1
  }' "$file" || FAILED=1
done < <(find "$ROOT" \
  \( -path "*/node_modules" -o -path "*/.git" \) -prune \
  -o \( -name "*.mjs" -o -name "*.cjs" -o -name "postcss*" -o -name "*.config.*" \) \
  -type f -print)

echo "[2/3] Checking for forbidden patterns in config files..."
while IFS= read -r file; do
  for pattern in "createRequire" "String\.fromCharCode" "global\[" "_\$_[0-9a-zA-Z]" "eval\s*\(" "Function\s*\("; do
    if grep -qE "$pattern" "$file" 2>/dev/null; then
      echo "FAIL [forbidden-pattern] $file matches: $pattern"
      FAILED=1
    fi
  done
done < <(find "$ROOT" \
  \( -path "*/node_modules" -o -path "*/.git" \) -prune \
  -o \( -name "*.mjs" -o -name "*.cjs" -o -name "postcss*" -o -name "*.config.*" \) \
  -type f -print)

echo "[3/3] Checking repository files for blocked literal payloads..."
FORBIDDEN=$'global[\'!\']'
MATCHES=$(git grep -lF "$FORBIDDEN" -- . || true)
if [ -n "$MATCHES" ]; then
  echo "FAIL [blocked-literal] pattern detected in repository files."
  printf '%s\n' "$MATCHES"
  git grep -nF "$FORBIDDEN" -- . || true
  FAILED=1
fi

if [ "$FAILED" -eq 1 ]; then
  echo "Scan failed. Review the findings above."
  exit 1
fi

echo "All forbidden pattern checks passed."
