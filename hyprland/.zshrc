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
alias ls="eza --icons"
alias la="eza --icons -a"
alias ll="eza --icons -l"
alias lla="eza --icons -la"
alias ssh="kitten ssh"
alias vi="nvim"
alias vim="nvim"

alias rm="gio trash" #NEVER AGAIN
alias gpp="g++"

alias hyfetch="hyfetch --distro $(uname -r | tr -cd '[:alpha:]')"

# Keybinds
bindkey "^[[3~" delete-char

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt CORRECT

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/catppuccin_mocha.omp.json)"

# Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/mustard/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

export PATH=$PATH:/home/nynke/.spicetify
