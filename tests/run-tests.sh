#!/bin/sh
# Pre-push test suite: static checks + Playwright functional tests
cd "$(dirname "$0")/.."

echo "=== Pattern checks ==="
sh tests/check-patterns.sh || exit 1

echo ""
echo "=== Playwright tests ==="
# Start local server (find an open port approach)
fuser -k 8777/tcp 2>/dev/null || true
sleep 0.5
python3 -m http.server 8777 &>/dev/null &
SERVER_PID=$!
sleep 1

# Run tests
npx playwright test --reporter=list
TEST_EXIT=$?

# Cleanup
kill $SERVER_PID 2>/dev/null
wait $SERVER_PID 2>/dev/null || true

exit $TEST_EXIT
