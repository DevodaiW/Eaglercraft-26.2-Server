# Eaglercraft Dynamic Relay on MyBinder

## Setup Instructions

1. Click to launch on MyBinder: [`https://mybinder.org/v2/gh/DevodaiW/Eaglercraft-26.2-Server-on-mybinder.org/HEAD`](https://mybinder.org/v2/gh/DevodaiW/Eaglercraft-26.2-Server-on-mybinder.org/HEAD)
2. Wait for the JupyterLab workspace interface to load.
3. In JupyterLab, open the **Terminal**.
4. You need to provide your Ngrok AuthToken before starting the server. Run the following command and follow the prompt:
   `bash run_server.sh`
5. Enter your Ngrok AuthToken when asked. The script will save it and boot the EaglerProxy server.
6. Connect your Eaglercraft client to the provided proxy URL. Type `/join <SERVER_IP>` in chat to bridge to any server.
