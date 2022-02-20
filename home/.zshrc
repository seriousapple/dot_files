source ~/00files/dot_files/aliases
source ~/00files/dot_files/ssh-ps1
source ~/00files/dot_files/local-aliases

#plugins
source ~/00files/dot_files/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/00files/dot_files/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

#history
SAVEHIST=10000
HISTSIZE=10000
HISTFILE="$XDG_DATA_HOME"~/.cache/zsh/history

#PS1 colors and layout
PROMPT="%F{magenta}%~%f"$'\n'"%F$hostStyleZ%n%f@%F{yellow}%m%f%# "
RPROMPT="%*"

setopt extended_glob nomatch auto_cd

#tab autocomplit
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#fat slim curosor in vi mode
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

