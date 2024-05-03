# Add to the bottom of the runcom file

# Custom aliases

export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:/home/meirbek/apps/nvim/bin
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias bashrc="nvim ~/.bashrc"
alias zshrc="nvim ~/.zshrc"
alias c="code"
alias n="nvim"

alias dnfi="sudo dnf install"
alias dnfr="sudo dnf remove"
alias dnfu="sudo dnf update"
alias fif="flatpak install flathub"
alias up='sudo dnf update -y && sudo dnf upgrade -y && flatpak update -y'
alias upr='sudo dnf update -y && sudo dnf upgrade --refresh -y && flatpak update -y'
alias cc="sudo dnf autoremove -y && dnf clean all -y && flatpak uninstall --unused -y && flatpak remove --delete-data && sudo journalctl --vacuum-time=1weeks && sudo rm -rf /tmp/*"

# Changing 'ls' to 'eza'
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -alF --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias l='eza -F --icons --color=always --group-directories-first'
alias l.='eza -a | egrep "^\."'
