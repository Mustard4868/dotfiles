#
#
#        ▒███████▒  ██████  ██░ ██  ██▀███   ▄████▄  
#        ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓██ ▒ ██▒▒██▀ ▀█  
#        ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▓██ ░▄█ ▒▒▓█    ▄ 
#          ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
#    ██▓ ▒███████▒▒██████▒▒░▓█▒░██▓░██▓ ▒██▒▒ ▓███▀ ░
#    ▒▓▒ ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ░▒ ▒  ░
#    ░▒  ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░  ░▒ ░ ▒░  ░  ▒   
#    ░   ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░  ░░   ░ ░        
#     ░    ░ ░          ░   ░  ░  ░   ░     ░ ░      
#     ░  ░                                  ░        
#
#
# Environment variables
USE_POWERLINE="true"
HAS_WIDECHARS="false"

# Autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# Aliases
alias ls="ls_extended"
alias la="ls_extended -a"
alias ll="ls_extended -l"
alias lla="ls_extended -la"
alias ssh="kitten ssh"
alias vi="nvim"
alias vim="nvim"

# Keybinds
bindkey "^[[3~" delete-char

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/catppuccin_mocha.omp.json)"

# Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/mustard/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
