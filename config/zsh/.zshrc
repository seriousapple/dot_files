source ~/00files/dot_files/aliases
source ~/00files/dot_files/ssh-ps1
source ~/00files/dot_files/gitprompt
source ~/00files/local/en-vars

#plugins
source "${XDG_CONFIG_HOME}/zsh/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${XDG_CONFIG_HOME}/zsh/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

#history
if [ ! -d "${XDG_CACHE_HOME}/zsh" ]; then
  mkdir -p "${XDG_CACHE_HOME}/zsh";
fi

if [ ! -d "${XDG_CACHE_HOME}/zsh/zsh_history" ]; then
  touch "${XDG_CACHE_HOME}/zsh/zsh_history";
fi

SAVEHIST=10000
HISTSIZE=20000
HISTFILE=~/.cache/zsh/zsh_history

#PS1 colors and layout
precmd() {
  PROMPT="%F$hostStyleZ%n%f at %F{yellow}%m%f in %F{magenta}%~%f"$'\n'"%* $(set_rprompt)"$'\n'"%# "
}

setopt extended_glob nomatch auto_cd

#tab autocomplit
autoload -U compinit
zstyle ':completion:*' menu select cache-path ~/.cache/zsh/zcompcache 
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
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

# fzf integration
source <(fzf --zsh)

