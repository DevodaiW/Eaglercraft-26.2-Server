# Eaglercraft Dynamic Relay on MyBinder

## Setup Instructions

1. Click to launch on MyBinder: [`https://mybinder.org/v2/gh/DevodaiW/Eaglercraft-26.2-Server/HEAD`](https://mybinder.org/v2/gh/DevodaiW/Eaglercraft-26.2-Server/HEAD)
2. Wait for the JupyterLab workspace interface to load.
3. In JupyterLab, open the **Terminal** (in the .
4. You need to provide your Ngrok AuthToken before starting the server. Run the following command and follow the prompt:
   `bash run_server.sh`
5. Enter your Ngrok AuthToken when asked.* The script will save it and boot the EaglerProxy server.
6. Connect your Eaglercraft client to the provided proxy URL (change https to wss to make it start with wss:// unless your client automatically changes it). Double click any server or connect to any server in your client and you will spawn in a dummy lobby and type `/join <SERVER_IP>` in chat to join to any server.

## *Find your Ngrok Authtoken

1. Go to ngrok.com and sign up.
2. click "Your Authtoken" on the left sidebar and click the eyelash icon next to bullet point-like characters and highlight it and copy it or press the copy button. You now have your AuthToken in your clipboard.
