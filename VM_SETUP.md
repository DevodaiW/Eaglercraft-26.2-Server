# Eaglercraft Server Setup on your Host

## Setup Instructions

 1. Clone this GitHub repo (`git clone https://github.com/DevodaiW/Eaglercraft-26.2-Server.git`)
 2. Get into the repo folder (`cd Eaglercraft-26.2-Server`)
 3. Make the files executable (`chmod +x run.sh`)
 4. In the folder, run the postBuild script ('bash postBuild`)
 5. You need to provide your Ngrok AuthToken* before starting the server, run the run_server.sh file  (`bash run_server.sh`)
 6. Enter your Ngrok AuthToken when asked*, this is for tunneling the server to you if your client doesn't support ws:// connections (if it does, type a dummy authtoken and put the IP address of the host on your client's relay config and put ws:// instead of wss://, eg. anything, authtoken, ect.)
 7. Connect your Eaglercraft client to the provided proxy URL (or ip, if it is ip, change http to ws://, if not, change https:// to wss:// wss:// unless your client automatically changes it). Double click any server or connect to any server in your client and you will spawn in a dummy lobby and type `/join <SERVER_IP>` in chat to join to any server.

## *Find your Ngrok Authtoken

 1. Go to ngrok.com and sign up.
 2. click "Your Authtoken" on the left sidebar and click the eyelash icon next to bullet point-like characters and highlight it and copy it or press the copy button. You now have your AuthToken in your clipboard.
