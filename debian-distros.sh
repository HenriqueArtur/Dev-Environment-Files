#!/bin/bash

# SYSTEM
echo "=> ⏳ Configuring general system behavior"
echo "--> ⬇ Update System"
sudo apt update
sudo apt upgrade -y
echo "--> 🔄 Change between workspace apps"
gsettings set org.gnome.shell.app-switcher current-workspace-only true
echo "> 🔧 Finished configs general systme, behavior"

echo ""
echo "--------------------"
echo ""

# SPOTIFY
echo "=> ⏳ Installing [SPOTIFY (flatpak)]..."
flatpak install flathub com.spotify.Client
echo "> 🎵 [SPOTIFY (flatpak)] instaled."

echo ""
echo "--------------------"
echo ""

# ZSH
echo "=> ⏳ Installing [ZSH]..."
sudo apt install zsh -y
sudo chsh -s $(which zsh)
echo "> 👾 [ZSH] instaled."

echo ""
echo "--------------------"
echo ""

# Powerlevel10k
echo "=> ⏳ Installing [Powerlevel10k]..."
echo "--> Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "--> Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
	${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git \
	${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
echo "--> Copy Oh My Zsh configs..."
cp .zshrc ~/.zshrc
echo "--> Installing p10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "--> Copy p10k configs for root..."
cp .p10k.zsh ~/.p10k.zsh
echo "> 🖌 [Powerlevel10k] instaled."

echo ""
echo "--------------------"
echo ""

# AURA THEME GNOME
echo "=> ⏳ Installing [AURA THEME GNOME]..."
cp aura-theme.dconf ~/aura-theme.dconf
dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ <~/aura-theme.dconf
echo "> 👻  [AURA THEME GNOME] instaled."

echo ""
echo "--------------------"
echo ""

# ASDF
echo "=> ⏳ Installing [ASDF]..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
echo "--> Installing ASDF plugins..."
source ~/.zshrc
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.19.1
asdf global nodejs 18.19.1
echo "> 🔖  [ASDF] instaled."

echo ""
echo "--------------------"
echo ""

# GITMOJI
echo "=> ⏳ Installing [GITMOJI]..."
npm i -g gitmoji-cli
echo "> 😜 [GITMOJI] instaled."

echo ""
echo "--------------------"
echo ""

# LAZYGIT
echo "=> ⏳ Installing [LAZYGIT]..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit
rm -rf lazygit.tar.gz
echo "> 😴 [LAZYGIT] instaled."

echo ""
echo "--------------------"
echo ""

# TMUX
echo "=> ⏳ Installing [TMUX]..."
sudo apt install tmux
cp .tmux.conf ~/.tmux.conf
echo "> 👥 [TMUX] instaled."

echo ""
echo "--------------------"
echo ""

# NEOVIM
echo "=> ⏳ Installing [NEOVIM]..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim
rm -rf nvim.appimage
sudo cp -r ./configs/nvim ~/.configs
echo "> 📑 [NEOVIM] instaled."

echo ""
echo "--------------------"
echo ""

# Docker
echo "=> ⏳ Installing [Docker]..."
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
	sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable /usr/lib/systemd/system/docker.service
echo "> 🐋 [Docker] instaled."

echo ""
echo "--------------------"
echo ""

echo "~ The End ~"
