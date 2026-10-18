#!/bin/bash
set -e

# =========================================================
# CONFIGURATION
# Insert your Ngrok Auth Token from https://dashboard.ngrok.com/get-started/your-authtoken
# =========================================================
NGROK_AUTHTOKEN="YOUR_NGROK_AUTHTOKEN_HERE"
PORT=8081

echo "=== 1. Setting up EaglerProxy ==="
if [ ! -d "proxy-app" ]; then
  git clone https://github.com/WorldEditAxe/eaglerproxy.git proxy-app
fi

cd proxy-app

# Install Node dependencies
npm install --silent
npm install tsx --save-dev --silent

# Patch PluginManager and EagProxyAAS metadata for TypeScript entry points
sed -i 's/!metadata.entry_point.endsWith(".js")/false/g' src/proxy/pluginLoader/PluginManager.ts 2>/dev/null || true
sed -i 's/metadata.entry_point.endsWith(".js")/false/g' src/proxy/pluginLoader/PluginManager.ts 2>/dev/null || true
sed -i 's/"entry_point": "index.js"/"entry_point": "index.ts"/g' src/plugins/EagProxyAAS/metadata.json 2>/dev/null || true

# Write universal module configuration
cat << 'EOF' > config.ts
const CONFIG = {
  bindHost: "0.0.0.0",
  bindPort: 8081,
  maxConcurrentClients: 200,
  client: {
    version: "1.8.8",
    brand: "EaglerProxy Relay"
  },
  server: {
    host: "127.0.0.1",
    port: 25565
  },
  motd: {
    l1: "EaglerProxy Dynamic",
    l2: "Powered by EagPaaS"
  },
  skins: {
    skinUrl: "https://textures.minecraft.net/texture/",
    cache: {
      enabled: true,
      maxAge: 86400000
    }
  },
  adapter: {
    name: "EagPaaS",
    version: "1.0",
    useNatives: true
  }
};

export const bindHost = CONFIG.bindHost;
export const bindPort = CONFIG.bindPort;
export const maxConcurrentClients = CONFIG.maxConcurrentClients;
export const client = CONFIG.client;
export const server = CONFIG.server;
export const motd = CONFIG.motd;
export const skins = CONFIG.skins;
export const adapter = CONFIG.adapter;
export const config = CONFIG;
export const CONFIG = CONFIG;
export default CONFIG;
EOF

# Sync config file to all expected import resolution paths
cp config.ts CONFIG.ts
cp config.ts src/config.ts
cp config.ts src/CONFIG.ts

echo "=== 2. Starting EaglerProxy background process ==="
pkill -f tsx || true
./node_modules/.bin/tsx src/index.ts &
sleep 3

echo "=== 3. Starting Tunnel ==="

if [ "$NGROK_AUTHTOKEN" != "YOUR_NGROK_AUTHTOKEN_HERE" ] && [ -n "$NGROK_AUTHTOKEN" ]; then
  # --- NGROK METHOD ---
  if ! command -v ngrok &> /dev/null && [ ! -f "./ngrok" ]; then
    echo "Downloading Ngrok binary..."
    curl -sSL https://bin.equinox.io/c/b4pvdg2pnwb/ngrok-v3-stable-linux-amd64.tgz | tar -xz
  fi

  NGROK_BIN=$(command -v ngrok || echo "./ngrok")
  $NGROK_BIN config add-authtoken "$NGROK_AUTHTOKEN" > /dev/null

  pkill -f ngrok || true
  $NGROK_BIN http $PORT --log=stdout > ngrok.log &
  sleep 4

  PUBLIC_URL=$(curl -s http://localhost:4040/api/tunnels | grep -o '"public_url":"[^"]*' | head -n1 | cut -d'"' -f4)
  WSS_URL=$(echo "$PUBLIC_URL" | sed 's/https:\/\//wss:\/\//' | sed 's/http:\/\//ws:\/\//')

else
  # --- CLOUDFLARE FALLBACK METHOD (No Token Required) ---
  echo "No Ngrok auth token detected. Using Cloudflare Tunnel..."
  if [ ! -f "./cloudflared" ]; then
    curl -sL -o cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
    chmod +x cloudflared
  fi

  pkill -f cloudflared || true
  ./cloudflared tunnel --url http://localhost:$PORT > cloudflared.log 2>&1 &
  sleep 6

  PUBLIC_URL=$(grep -o 'https://[-a-zA-Z0-9]*\.trycloudflare\.com' cloudflared.log | head -n1)
  WSS_URL=$(echo "$PUBLIC_URL" | sed 's/https:\/\//wss:\/\//')
fi

echo ""
echo "=========================================================="
echo " SUCCESS! CONNECT YOUR EAGLERCLIENT TO:"
echo " ${WSS_URL}/"
echo "=========================================================="
echo "Keep this terminal open while playing."

# Keep process alive
tail -f /dev/null
