#!/bin/sh
# Static checks for known browser API pitfalls
ERRORS=0

# Check: resume() without await
UNWAITED=$(grep -rn '\.resume()' *.html 2>/dev/null | grep -v 'await' | grep -v '^\s*//')
if [ -n "$UNWAITED" ]; then
  echo "ERROR: audioCtx.resume() called without await:"
  echo "$UNWAITED"
  ERRORS=$((ERRORS + 1))
fi

# Check: AudioContext without webkit fallback
RAW_CTX=$(grep -rn 'new AudioContext()' *.html 2>/dev/null | grep -v 'webkitAudioContext')
if [ -n "$RAW_CTX" ]; then
  echo "ERROR: AudioContext without webkitAudioContext fallback:"
  echo "$RAW_CTX"
  ERRORS=$((ERRORS + 1))
fi

# Check: songs.json is valid JSON
if [ -f songs.json ]; then
  python3 -c "import json; json.load(open('songs.json'))" 2>/dev/null
  if [ $? -ne 0 ]; then
    echo "ERROR: songs.json is not valid JSON"
    ERRORS=$((ERRORS + 1))
  fi
fi

# Check: fetch without response.ok
FETCH_NO_OK=$(grep -rn '\.then(r => r\.json())' *.html 2>/dev/null)
if [ -n "$FETCH_NO_OK" ]; then
  echo "ERROR: fetch().then(r => r.json()) without checking r.ok:"
  echo "$FETCH_NO_OK"
  ERRORS=$((ERRORS + 1))
fi

# Check: linearRampToValueAtTime (broken in macOS Safari)
LINEAR_RAMP=$(grep -rn 'linearRampToValueAtTime' *.html 2>/dev/null)
if [ -n "$LINEAR_RAMP" ]; then
  echo "WARNING: linearRampToValueAtTime found (broken in macOS Safari, use setTargetAtTime):"
  echo "$LINEAR_RAMP"
fi

if [ $ERRORS -gt 0 ]; then
  echo ""
  echo "$ERRORS pattern check(s) failed."
  exit 1
fi

echo "Pattern checks passed."
exit 0
