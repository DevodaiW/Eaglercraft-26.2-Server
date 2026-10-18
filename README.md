# Eaglercraft Dynamic Relay on MyBinder

A zero-cost, high-speed EaglerProxy relay running on MyBinder (Google Kubernetes Engine) with low latency.

## How to Launch

1. Click to launch on MyBinder: [https://mybinder.org/v2/gh/<YOUR_GITHUB_USERNAME>/<YOUR_REPO_NAME>/HEAD](https://mybinder.org/v2/gh/DevodaiW/Eaglercraft-26.3-Server-on-mybinder.org/HEAD)
2. Wait for the JupyterLab workspace interface to load.

## How to Connect

1. Look at your browser address bar:
   `https://<url>/lab`
2. Copy your workspace ID string (e.g., `hub.gesis.mybinder.org/user/devodaiw-eagler-on-mybinder.org-p8xp4u2v`).
3. Construct your connection URL using `wss://` and keeping the trailing slash and put a question mark after `8081`:
   `wss://<url>/proxy/8081/`

## How to Play

1. Open your Eaglercraft client.
2. Add a new server with your `wss://` link.
3. Join the server. You will enter the proxy lobby.
4. Type `/join <SERVER_IP>` in chat (e.g., `/join crackedpvp.club` or `/join mc.hypixel.net`) to bridge to any server on demand.
