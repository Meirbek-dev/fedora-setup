# fedora-setup

## My Fedora 40, KDE 6 configuration

### Open runcom file

```bash
nano ~/.bashrc
```

### Set default dnf response to "Y"

```bash
echo "defaultyes=True" >> /etc/dnf/dnf.conf
```

### System update, upgrade and clean up from old packages

```bash
upr
sudo dnf makecache --refresh
sudo dnf -y groupupdate core
cc
```

### [Enabling the RPM Fusion repositories](https://docs.fedoraproject.org/en-US/quick-docs/rpmfusion-setup/)

```bash
dnfi -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnfi -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted
```

### Updating firmware

```bash
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update
```

### Enabling firewall

```bash
sudo dnf install firewalld
sudo systemctl unmask firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
```

### Installing zsh with [oh-my-zsh](https://ohmyz.sh/#install)

```bash
dnfi zsh exa -y
zsh
chsh -s /bin/zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-exa
git clone https://github.com/ptavares/zsh-exa.git ~/.oh-my-zsh/custom/plugins/zsh-exa

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# set theme and plugins in .zshrc
zshrc

# ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-exa)

source ~/.zshrc
```

### Configuring git

```bash
git config --global user.name "Meirbek"
git config --global user.email "meirbek@email.com"

# Set timeout for reauthorization to 1 month
git config --global credential.helper 'cache --timeout=2628000'
```

### Installing useful apps & packages

```bash
dnfi -y neofetch btop htop git bleachbit stacer tlp tlp-rdw qbittorrent curl cabextract xorg-x11-font-utils fontconfig libdvdcss dnf-plugins-core vlc ranger

dnfi -y java-latest-openjdk.x86_64
dnfi -y gtk3-devel gcc gcc-c++ kernel-devel pkg-config make cmake clang
dnfi -y @development-tools
# Archives
dnfi -y unzip p7zip p7zip-plugins unrar

# Fonts
dnfi -y 'google-roboto*' 'mozilla-fira*' fira-code-fonts
# Microsoft fonts
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Multimedia
dnfi -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav mozilla-openh264 --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
dnfi -y lame* --exclude=lame-devel
sudo dnf update gstreamer1
sudo dnf install gstreamer1-devel gstreamer1-plugins-base-devel
sudo dnf install gstreamer1-plugins-bad-free
sudo dnf config-manager --set-enabled fedora-cisco-openh264

sudo dnf -y groupupdate sound-and-video
sudo dnf -y group upgrade --with-optional --allowerasing Multimedia
```

### Installing NCALayer

```bash
[Download NCALayer](https://ncl.pki.gov.kz/)
# Install NCALayer dependencies
dnfi zenity vim-common
```

### [Installing VS Code](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions)

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code
```

### Enabling automatic dnf updates (weekly by default)

```bash
dnfi -y dnf-automatic

# edit config if needed
sudo n /etc/dnf/automatic.conf

sudo systemctl enable --now dnf-automatic.timer
```

### Installing proprietary NVIDIA drivers with CUDA

```bash
dnfi gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-power xorg-x11-drv-nvidia-cuda nvidia-settings
dnfi nvidia-vaapi-driver libva-utils vdpauinfo
nvidia-smi
```

### Removing irrelevant packages

```bash
# Fonts for languages that I don't know
sudo dnf remove default-fonts-other-serif
```

### Limit to 2 kernels

```bash
rpm -q kernel
sudo dnf remove --oldinstallonly --setopt installonly_limit=2 kernel
sudo dnf remove {kernel_version}
```

### Flatpaks & Flathub

```bash
# installing flatpak
dnfi -y flatpak

# adding flathub
flatpak remote-modify --enable flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# installing apps
fif org.telegram.desktop
fif com.ktechpit.whatsie
fif com.discordapp.Discord
fif us.zoom.Zoom

fif com.spotify.Client
fif com.obsproject.Studio
fif com.google.Chrome
fif com.github.tchx84.Flatseal
fif com.calibre_ebook.calibre
fif com.todoist.Todoist
fif org.mozilla.Thunderbird

fif org.jupyter.JupyterLab
fif com.jetbrains.IntelliJ-IDEA-Ultimate
fif com.jetbrains.PyCharm-Professional
fif com.jetbrains.WebStorm
```

### [Make Python 3.11 default]

```bash
sudo dnf install python3.11
sudo ln -sf /usr/bin/python3.11 /usr/bin/python
```

### [Install Anaconda](https://www.anaconda.com/download)

### Scikit-learn acceleration

```bash
conda install scikit-learn-intelex
```

### Updating and cleaning irrelevant Anaconda packages

```bash
conda update conda
conda update --all
conda clean --all
```

### Installing conda version of pip

```bash
conda install pip
which pip
```

### Installing Language Server Protocols and python formatters

```bash
npm install bash-language-server
pip install python-language-server ruff
pip install --upgrade jupyter_lsp notebook_shim chardet
pip install pycodestyle mccabe pyflakes pylint rope yapf autopep8 pydocstyle
```

### Installing Jupyter Lab & Notebook dependencies

```bash
conda install jupyterlab notebook nb_conda_kernels chardet
```

### Creating conda environment for TensorFlow + CUDA development

```bash
conda create -n fras pip python=3.11
conda activate fras
conda update conda
conda update --all
pip install tensorflow[and-cuda]==2.13.1
pip install nvidia-cudnn-cu11==8.6.*
conda install cudatoolkit=11.8.*
conda install -c anaconda cmake
conda install opencv matplotlib
pip install --upgrade customtkinter deepface
echo "conda activate fras" >> ~/.bashrc
# Verifying that Tensorflow is working properly
python -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
# Verifying that GPU is available for Tensorflow
python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"

sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora35/x86_64/cuda-fedora35.repo
sudo dnf module disable nvidia-driver
sudo dnf -y install cuda
```

### Conda environment autostart

```bash
CONDA_ENV_NAME = "example"
echo "conda activate $CONDA_ENV_NAME" >> ~/.bashrc
echo "conda activate $CONDA_ENV_NAME" >> ~/.zshrc
```

### Disable NUMA unavialability error messages in TensorFlow

```bash
export TF_CPP_MIN_LOG_LEVEL=1
```

### Pulling offical TensorFlow Docker image

```bash
docker pull tensorflow/tensorflow

```

### Run container with GPU support and Python interpreter

```bash
docker run -it --rm --gpus all tensorflow/tensorflow:latest-gpu python
```

### Run Jupyter Notebook Server with GPU support and Python interpreter

```bash
docker run -it --rm --gpus all -v $(realpath ~/notebooks):/tf/notebooks -p 8888:8888 tensorflow/tensorflow:latest-gpu-jupyter
```

### Installing and configuring web development tools

### [NVM installation docs](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)

```bash

curl -qL https://www.npmjs.com/install.sh | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
nvm use node

nvm -v
npm -v
node -v
```

### Install JS tooling

```bash
npm -g install @biomejs/biome oxlint tslint depcheck npm-check-updates typescript prettier pnpm yarn pnpm deno bun eslint corepack
```

### [Installing Neovim & NvChad](https://nvchad.com/docs/quickstart/install)

```bash
dnfi python3-neovim
chmod 777 ./apps/nvim/bin/nvim
export PATH=$PATH:/home/meirbek/Apps/nvim/bin
source ~/.zshrc
# NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
echo "vim.opt.relativenumber = true" >> ~/.config/nvim/lua/custom/init.lua
```

### [Installing Nerd Fonts](https://www.nerdfonts.com/font-downloads)

```bash
sudo cp ~/Downloads/JetBrainsMono/*.ttf /usr/share/fonts/
sudo chmod 644 /usr/share/fonts/*.ttf
sudo fc-cache -f -v
fc-list | grep "JetBrains Mono"
```

## Other resources

### [Installing MySQL](https://docs.fedoraproject.org/en-US/quick-docs/installing-mysql-mariadb/)

### [Installing PostgreSQL](https://docs.fedoraproject.org/en-US/quick-docs/postgresql/#installation/)

### [Set DNS to Quad9](echo -e "nameserver 9.9.9.9\nnameserver 149.112.112.112" | sudo tee /etc/resolv.conf)

### To increase scale factor add an argument to application properties "--force-device-scale-factor=1.25"
