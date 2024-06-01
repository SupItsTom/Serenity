# Serenity Source Release
This repository, and the contents in it, are not licensed and you can do whatever you want with it.\
You are free to distribute without giving me credits, aswell as sell your mod.\
However, please change the name from **Serenity** before distributing.

## Compiling
Make sure you download [GSC Studio](https://cdn2.supitstom.net/setup-gscstudio-160215.exe) and set it up before continuing.
1. Fork the repository to your GSC Studio projects folder
2. Open GSC Studio, click **Connect** and choose **Offline Mode**
3. Press **Ctrl+O** to open the project selector dialog and select **Serenity**
   - if you forked to a directory that isnt the projects folder, click **Change location** and find it
4. Make changes to the mod, and when ready to compile, select **Editor** and then **Export the project to a compiled script file**

From here you can inject your mod to your platform (aslong as connection is not in **Offline mode**)

## Testing
I recommend using Plutonium for testing your mod quickly. [Here is a guide on how to load your mod into Plutonium](https://plutonium.pw/docs/modding/loading-mods/#t6).\
Just note that some features available on Plutonium are not available on Consoles, such as `println` & `assertmsg`.
