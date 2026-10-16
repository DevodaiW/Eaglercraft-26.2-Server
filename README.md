# Eaglercraft 26.3 Server Bridge for MyBinder

This repository allows you to host a temporary Eaglercraft 26.3 proxy bridge using MyBinder.org. By utilizing Jupyter Server Proxy, it routes WebSocket traffic through Binder's infrastructure, allowing you to connect to standard Minecraft servers directly from your browser.

## 🚀 How to Host
Click the link below to spin up your temporary Binder workspace:
[**Launch on MyBinder**](https://mybinder.org/v2/gh/DevodaiW/Eaglercraft-26.3-Server-on-mybinder.org/HEAD)

## 🔌 How to Connect
Once your Binder instance is running, you must format the connection URL for your Eaglercraft client.

1. **Find your Workspace URL:** Look at the URL in your browser once the Binder workspace loads. It will look something like this:
   `https://hub.bids.mybinder.org/user/devodaiw-eagler-on-mybinder.org-fo92ja17/lab`
2. **Extract your Workspace ID:** Note the unique string of characters (e.g., `fo92ja17`).
3. **Format the WSS Link:** Change `https://` to `wss://`, remove `/lab`, and append `/proxy/8081/` (or whichever port your `config.yml` is set to listen on).

**Example Eaglercraft Connection URL:**
`wss://hub.bids.mybinder.org/user/devodaiw-eagler-on-mybinder.org-fo92ja17/proxy/8081/`

---
*⚠️ Note: MyBinder environments are temporary. The server will shut down after 10 minutes of inactivity or when you close the browser tab.*
