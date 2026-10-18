# Eaglercraft 26.2 Server (Relay) Setup

## Options with pros and cons

1. Use mybinder.org to host it ([BINDER_SETUP.md](https://github.com/DevodaiW/Eaglercraft-26.2-Server/blob/main/BINDER_SETUP.md))
   +: Easy and quick
   +: Has fast internet (depends on the client's internet and hardware too)
   -: You have to store your Ngrok AuthToken somewhere to use it if the server stops
   -: The files don't save if you quit, not that important if you don't add anything to the project except your AuthToken

3. Host on your own host (hopefully Linux, this may not work on other OS [VM_SETUP.md](https://github.com/DevodaiW/Eaglercraft-26.2-Server/blob/main/VM_SETUP.md))
   +: Saves all the files after you stop the program or your host
   +: Saves your Ngrok Authtoken
   -: Requires a bit of manual setup
   -: Internet speed depends on your host (also depends on the client's internet and hardware too)
