# Eaglercraft Dynamic Relay on MyBinder

This is a dynamic EaglerProxy relay. You can use it to connect to any standard Minecraft server via your browser.

## 🚀 How to Host
[**Launch on MyBinder**](https://mybinder.org/v2/gh/DevodaiW/Eaglercraft-26.3-Server-on-mybinder.org/HEAD)

## 🔌 How to Connect
Wait for your Binder instance to load, then look at the URL in your browser:
`https://hub.bids.mybinder.org/user/devodaiw-eagler-on-mybinder.org-fo92ja17/lab`

Extract your workspace ID (e.g., `fo92ja17`), and build your WebSocket link by passing the target server's IP and port at the end.

**Format:**
`ws://hub.bids.mybinder.org/user/devodaiw-eagler-on-mybinder.org-fo92ja17/proxy/8081/?ip=<SERVER_IP>&port=<PORT>`

**Example (Connecting to Hypixel):**
`ws://hub.bids.mybinder.org/user/devodaiw-eagler-on-mybinder.org-fo92ja17/proxy/8081/?ip=mc.hypixel.net&port=25565`
