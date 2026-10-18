#!/bin/bash
set -e

if [ ! -d "proxy-app" ]; then
  git clone https://github.com/WorldEditAxe/eaglerproxy.git proxy-app
fi

cd proxy-app
npm install
npm install tsx --save-dev

# Patch PluginManager for TypeScript entry points
sed -i 's/!metadata.entry_point.endsWith(".js")/false/g' src/proxy/pluginLoader/PluginManager.ts
sed -i 's/metadata.entry_point.endsWith(".js")/false/g' src/proxy/pluginLoader/PluginManager.ts
sed -i 's/"entry_point": "index.js"/"entry_point": "index.ts"/g' src/plugins/EagProxyAAS/metadata.json
