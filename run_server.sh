#!/bin/bash
set -e

# Prompt for AuthToken
echo "Enter your AuthToken:"
read AUTHTOKEN

# Save the token to a local file for reference/tunneling tools
echo "AUTHTOKEN=$AUTHTOKEN" > .env
echo "AuthToken saved to .env file."

# Stop any conflicting processes
pkill -f node || true
pkill -f tsx || true

if [ -d "proxy-app" ]; then
  cd proxy-app
  
  # Mirror config file
  cp ../config.ts CONFIG.ts
  cp ../config.ts src/config.ts
  cp ../config.ts src/CONFIG.ts

  echo "Starting EaglerProxy..."
  ./node_modules/.bin/tsx src/index.ts
else
  echo "Error: proxy-app directory not found. Did postBuild run correctly?"
fi
