sudo dnf install neofetch btop htop git bleachbit stacer
sudo dnf remove default-fonts-other-serif
sudo bleachbit
nano /etc/dnf/dnf.conf

sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf groupupdate core
sudo dnf install flatpak
flatpak remote-modify --enable flathub
sudo dnf install -y unzip p7zip p7zip-plugins unrar
sudo dnf install -y 'google-roboto*' 'mozilla-fira*' fira-code-fonts
sudo dnf install tlp tlp-rdw
sudo dnf install dnf-automatic -y
sudo nano /etc/dnf/automatic.conf
sudo systemctl enable --now dnf-automatic.timer
sudo nano /etc/systemd/system.conf
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo dnf install qbittorrent
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
flatpak install spotify
flatpak install flatseal
flatpak install obs
flatpak install flathub com.obsproject.Studio
flatpak install flathub com.google.Chrome
flatpak install flathub org.telegram.desktop

sudo dnf upgrade --refresh
sudo dnf -y groupupdate core
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y rpmfusion-nonfree-release-tainted
sudo dnf install -y dnf-plugins-core
sudo dnf install -y libdvdcss
sudo dnf install -y gstreamer1-plugins-{bad-*,good-*,ugly-*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
sudo dnf install -y lame* --exclude=lame-devel
sudo dnf -y groupupdate sound-and-video
sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264
sudo dnf group upgrade --with-optional Multimedia
sudo dnf install -y fira-code-fonts 'mozilla-fira*' 'google-roboto*'
sudo dnf group upgrade --with-optional --allowerasing Multimedia
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf install -y unzip p7zip p7zip-plugins unrar
flatpak install Flatseal
flatpak install spotify
flatpak remove chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install gstreamer-plugins-{bad,ugly,good} gstreamer1-plugins-{bad-free,ugly-free,good-free} ffmpeg
sudo firewall-cmd --add-service=http --permanent sudo firewall-cmd --add-service=https --permanent sudo firewall-cmd --reload
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
sudo dnf install -y vlc
flatpak install flathub us.zoom.Zoom
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub com.rtosta.zapzap
flatpak install flathub com.calibre_ebook.calibre
flatpak install flathub com.todoist.Todoist
flatpak install flathub com.leinardi.gwe
flatpak install flathub io.github.gamingdoom.Datcord
flatpak install flathub com.github.d4nj1.tlpui
flatpak install flathub org.mozilla.Thunderbird
flatpak install flathub com.visualstudio.code
flatpak install flathub org.jupyter.JupyterLab
sudo dnf install akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda
sudo dnf install zsh
sudo nano /etc/dnf/dnf.conf
zsh
sudo dnf install nerd-fonts-
sudo fc-cache -fv
sudo mkdir -p /usr/local/share/fonts/jetbrainsmono
sudo chown -R root: /usr/local/share/fonts/*
sudo chmod 644 /usr/local/share/fonts/*
sudo chmod 644 /usr/local/share/fonts/jetrainsmono/*
sudo chown -R root: /usr/local/share/fonts/jetbrainsmono/*
sudo restorecon -vFr /usr/local/share/fonts/jetbrainsmono/
sudo fc-cache -v
neofetch
zsh
 cd /home/meirb/Downloads
 clear
 cd /usr/local/share/fonts/jetbrainsmono
 cd /home/meirb/Downloads
sudo cp JetBrainsMono* /usr/local/share/fonts/jetbrainsmono/
 cd /usr/local/share/fonts/jetbrainsmono
chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
omz update
source ~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
p10k configure
sudo apt install exa
git clone https://github.com/ptavares/zsh-exa.git ~/.oh-my-zsh/custom/plugins/zsh-exa
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off


sudo dnf install python3-neovim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
o
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

python3 -m pip install tensorflow[and-cuda]
which python
source ~/anaconda3/bin/activate
export PATH=~/anaconda3/bin:$PATH

