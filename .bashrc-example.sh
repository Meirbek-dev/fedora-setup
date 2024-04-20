# Add to the bottom of the runcom file

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/meirb/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/meirb/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/meirb/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/meirb/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# manually added

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
export PATH=$PATH:/home/meirb/apps/nvim/bin
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias bashrc="nvim ~/.bashrc"
alias zshrc="nvim ~/.zshrc"
alias c="code"
alias n="nvim"
alias jl='jupyter-lab'
alias jn='jupyter-notebook'

alias up='sudo dnf update -y && sudo dnf upgrade --refresh -y && flatpak update -y'
alias upr='sudo dnf update -y && sudo dnf upgrade --refresh -y && flatpak update -y'
alias cc="sudo dnf autoremove && dnf clean all && flatpak uninstall --unused -y && flatpak remove --delete-data && sudo journalctl --vacuum-time=1weeks"
alias dnfi="sudo dnf install"
alias fif="flatpak install flathub"

# Changing 'ls' to 'eza'
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -alF --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias l='eza -F --icons --color=always --group-directories-first'
alias l.='eza -a | egrep "^\."'

export TF_CPP_MIN_LOG_LEVEL=1
