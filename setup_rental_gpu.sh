#!/bin/bash
apt update
apt install npm aria2 -y
git clone https://github.com/Stability-AI/StableSwarmUI
cd ~/StableSwarmUI


wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
dpkg -i cloudflared-linux-amd64.deb

#install dotnet

cd ~/StableSwarmUI/launchtools

rm dotnet-install.sh

# https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install

wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh

chmod +x dotnet-install.sh



# Note: manual installers that want to avoid home dir, add to both of the below lines: --install-dir $SCRIPT_DIR/.dotnet

./dotnet-install.sh --channel 8.0 --runtime aspnetcore

./dotnet-install.sh --channel 8.0

# Download Models
mkdir ~/StableSwarmUI/Models/Stable-Diffusion -p
cd ~/StableSwarmUI/Models/Stable-Diffusion

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/592322?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=92f89fe23673363606c9316a9939ee2e" # Blue pencil XL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/403131?type=Model&format=SafeTensor&size=full&fp=fp16&token=92f89fe23673363606c9316a9939ee2e" # AnimagineXL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/597138?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=92f89fe23673363606c9316a9939ee2e" # Anima pencil XL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/549113?type=Model&format=SafeTensor&size=full&fp=fp16&token=92f89fe23673363606c9316a9939ee2e" # AingDiffusion XL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/290640?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=92f89fe23673363606c9316a9939ee2e" # Pony Diffusion XL

# Download VAE
mkdir ~/StableSwarmUI/Models/VAE -p
cd ~/StableSwarmUI/Models/VAE
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/403131?type=VAE&format=SafeTensor&token=92f89fe23673363606c9316a9939ee2e" # AnimagineXL VAE
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/290640?type=VAE&format=SafeTensor&token=92f89fe23673363606c9316a9939ee2e" # Pony Diffusion XL VAE

# Download Lora
mkdir ~/StableSwarmUI/Models/Lora -p
cd ~/StableSwarmUI/Models/Lora
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/586723?type=Model&format=SafeTensor&token=92f89fe23673363606c9316a9939ee2e" # Before and after XL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/177544?type=Model&format=SafeTensor&token=92f89fe23673363606c9316a9939ee2e" # LineAniRedmond XL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/577222?type=Model&format=SafeTensor&token=92f89fe23673363606c9316a9939ee2e" # Rosa XL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/471794?type=Model&format=SafeTensor&token=92f89fe23673363606c9316a9939ee2e" # Hand XL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/333607?type=Model&format=SafeTensor&token=92f89fe23673363606c9316a9939ee2e" # Smooth Anime Style for Pony Diffusion XL

# Download Embed
mkdir ~/StableSwarmUI/Models/Embeddings -p
cd ~/StableSwarmUI/Models/Embeddings
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/454217?type=Model&format=SafeTensor&token=92f89fe23673363606c9316a9939ee2e" # DeepNegative XL
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://civitai.com/api/download/models/641519?type=Negative&format=Other&token=92f89fe23673363606c9316a9939ee2e" # unaesthetic XL, best for pony diffusion xl
cd ~/StableSwarmUI
bash ./launch-linux.sh --launch_mode none --cloudflared-path cloudflared&

