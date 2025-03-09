
# ==============================
# 🏗️ INITIALIZATION
# ==============================
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then 
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
# ==============================
# 🎨 PROMPT (Using Oh My Posh)
# ==============================
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# ==============================
# 🔌 ZINIT PLUGINS
# ==============================
zinit light vineyardbovines/auto-color-ls
zinit light akash329d/zsh-alias-finder
zinit ice url="https://github.com/Valiev/almostontop.git"
zinit light "Valiev/almostontop"
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light dracula/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

#source ~/.dracula-zsh-syntax/zsh-syntax-highlighting.zsh
# ==============================
# ⚡ CURSOR SETTINGS
# ==============================
function zle-line-init () { echo -e '\e[1 q' }   # Block cursor in normal mode
function zle-keymap-select () { echo -e '\e[5 q' } # Bar cursor in insert mode

# ==============================
# 🔗 KEYBINDINGS
# ==============================
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^f' autosuggest-accept
bindkey -v

# ==============================
# 🔥 ALIASES
# ==============================
alias ls='ls --color=auto'
alias nv='nvim'
alias c='clear'

# ==============================
# 🗃️ HISTORY SETTINGS
# ==============================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups

# ==============================
# 🖥️ PATHS & ENVIRONMENT VARIABLES
# ==============================
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/miniconda3/condabin:$PATH"
export XCURSOR_THEME=default
export XCURSOR_SIZE=24
export TERM=xterm-256color
export TMUX_CONF="$HOME/.config/tmux/tmux.conf"

# ==============================
# 🔍 ALIAS FINDER CUSTOMIZATION
# ==============================
export ZSH_ALIAS_FINDER_PREFIX="🔍 Alias Found:"
export ZSH_ALIAS_FINDER_SUFFIX="%F{cyan}"
export ZSH_ALIAS_FINDER_IGNORED="ls,rm,git"

# ==============================
# 📂 COMPLETION SETTINGS
# ==============================
autoload -U compinit && compinit
zinit cdreplay -q
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# ==============================
# 🚀 ZOXIDE (Faster `cd`)
# ==============================
eval "$(zoxide init zsh)"

# ==============================
# 🧪 CONDA INITIALIZATION
# ==============================
__conda_setup="$('/home/bhupen/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bhupen/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bhupen/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bhupen/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup




# Change command color to bright white or another dark color
#zmodload zsh/terminfo
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[command]='fg=white'  # Change 'white' to 'gray' or any visible color
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"
export PATH="/usr/lib/jvm/java-23-openjdk/bin:$PATH"
alias music='tmux new-session -s $$ "tmux source-file ~/.ncmpcpp/tsession"'
# Gruvbox Colors
GRUVBOX_BG="#282828"
GRUVBOX_FG="#ebdbb2"
GRUVBOX_YELLOW="#d79921"
GRUVBOX_RED="#cc241d"
GRUVBOX_GREEN="#98971a"

# Set prompt colors
autoload -U colors && colors
PROMPT="%F{$GRUVBOX_YELLOW}%n%F{$GRUVBOX_FG}@%F{$GRUVBOX_GREEN}%m %F{$GRUVBOX_FG}%~ %F{$GRUVBOX_RED}❯%f "
export PATH=$PATH:/opt/dbeaver
alias dbeaver='env -u WAYLAND_DISPLAY dbeaver'

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH
