./fm6000

#Enable colors
autoload -U colors && colors

# History configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '/home/carlos/.zshrc'

# Tabcompletion
autoload -Uz compinit
zstyle ':completion:*' menu select #Tab to move around 
zmodload zsh/complist 
setopt globdots
compinit

# Vi mode
# Code taken from: https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Aliases
source .aliases

# Load Starchipo prompt
eval "$(starship init zsh)"

# Syntax highlighting 
# zsh-syntax-highlighting and zsh-autosuggestions packages installed with pacman
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
