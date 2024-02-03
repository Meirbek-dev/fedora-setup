# fedora-setup

## My Fedora 39, KDE 5.27 configuration

Open runcom file

```bash
nano ~/.bashrc
```

And add aliases at the bottom of it

```bash
alias bashrc="nvim ~/.bashrc"
alias zshrc="nvim ~/.zshrc"
alias c="code"
alias n="nvim"
alias jl='jupyter-lab'
alias jn='jupyter-notebook'
alias nf="neofetch"

alias up='sudo dnf update -y && sudo dnf upgrade -y && flatpak update -y'
alias upr='sudo dnf update -y && sudo dnf upgrade --refresh -y && flatpak update -y'
alias cc="sudo dnf autoremove -y && dnf clean all -y && flatpak uninstall --unused -y && flatpak remove --delete-data && sudo journalctl --vacuum-time=1weeks"
alias dnfi="sudo dnf install"

# Changing 'ls' to 'eza'
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -alF --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias l='eza -F --icons --color=always --group-directories-first'
alias l.='eza -a | egrep "^\."'
```

System update, upgrade and cleaning from an old packages

```bash
upr
cc
```

Installation of a zsh with oh-my-zsh (https://ohmyz.sh/#install)

```bash
sudo apt install zsh exa -y
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
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
ZSH_THEME="powerlevel10k/powerlevel10k"
{ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

omz update

source ~/.zshrc
```

Git configuration

```bash
git config --global user.name "Meirbek"
git config --global user.email "meirbek@email.com"
```

Anaconda installation (https://www.anaconda.com/download)

```bash
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
chmod +x Anaconda*.sh
bash ./Anaconda*.sh -b -u
rm Anaconda*.sh
```

Scikit-learn acceleration

```bash
conda install scikit-learn-intelex
```

Updating and cleaning irrelevant Anaconda packages

```bash
conda update conda
conda update --all
conda clean --all
```

Installing conda version of pip

```bash
conda install pip
which pip
```

Installation of a Language Server Protocols and python formatters

```bash
npm install bash-language-server
pip install python-language-server # Does not support Python 3.11+
pip install --upgrade jupyter_lsp notebook_shim chardet
pip install pycodestyle mccabe pyflakes pylint rope yapf autopep8 pydocstyle
```

Jupyter Lab & Notebook dependencies

```bash
conda install jupyterlab notebook nb_conda_kernels chardet
```

Creating environment for TensorFlow + CUDA development

```bash
conda create -n fras pip python=3.11
conda activate fras
pip install --upgrade tensorflow[and-cuda] # stable
pip install --upgrade tf-nightly[and-cuda] # nightly
pip install --upgrade keras==2.15.0
pip install --upgrade customtkinter deepface
conda install opencv matplotlib
# Verifying that Tensorflow is working properly
python -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
# Verifying that GPU is available for Tensorflow
python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```

Conda environment autostart

```bash
CONDA_ENV_NAME = "example"
echo "conda activate $CONDA_ENV_NAME" >> ~/.bashrc
echo "conda activate $CONDA_ENV_NAME" >> ~/.zshrc
```

Nvidia GPU information

```bash
nvidia-smi
```

Disable NUMA unavialability error messages in TensorFlow

```bash
export TF_CPP_MIN_LOG_LEVEL=1
```

Pulling offical TensorFlow Docker image

```bash
docker pull tensorflow/tensorflow

```

Run container with GPU support and Python interpreter.

```bash
docker run -it --rm --gpus all tensorflow/tensorflow:latest-gpu python
```

Run Jupyter Notebook Server with GPU support and Python interpreter.

```bash
docker run -it --rm --gpus all -v $(realpath ~/notebooks):/tf/notebooks -p 8888:8888 tensorflow/tensorflow:latest-gpu-jupyter
```

Installing and configuring web development tools.

[NVM installation docs](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)

```bash

# Node Version Manager
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

npm -g install npm-check-updates typescript prettier pnpm yarn deno bun
```

Установка Neovim & NvChad (https://nvchad.com/docs/quickstart/install)

```bash
sudo dnf install python3-neovim
chmod 777 ./apps/nvim/bin/nvim
export PATH=$PATH:/home/meirb/apps/nvim/bin
source ~/.zshrc
# NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
