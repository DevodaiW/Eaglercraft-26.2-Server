#!/bin/bash
set -e

# Stop conflicting processes
pkill -f node || true
pkill -f tsx || true

# Patch EagPaaS plugin loader for TypeScript entry points
sed -i 's/!metadata.entry_point.endsWith(".js")/false/g' src/proxy/pluginLoader/PluginManager.ts
sed -i 's/"entry_point": "index.js"/"entry_point": "index.ts"/g' src/plugins/EagProxyAAS/metadata.json

# Mirror config file across all expected module resolution paths
cp config.ts CONFIG.ts
cp config.ts src/config.ts
cp config.ts src/CONFIG.ts

# Execute EaglerProxy with TSX runtime
./node_modules/.bin/tsx src/index.ts
