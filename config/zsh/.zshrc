source ~/00files/dot_files/aliases
source ~/00files/dot_files/ssh-ps1
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

#get git branch info

COLOR_GIT_REPOSITORY_TEXT='245'
COLOR_GIT_BRANCH_TEXT='255'
COLOR_GIT_STATUS_CLEAN='010'
COLOR_GIT_STATUS_DIRTY='009'
GLYPH_GIT_BRANCH_SYNC_SYMBOL='«'
GLYPH_GIT_STASH_SYMBOL='∘'
GLYPH_GIT_STATUS_SYMBOL='»'

set_rprompt() {
  local git_branch_name=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [[ -z $git_branch_name ]]; then
    RPROMPT=""

    return
  fi

  local git_remote_commit=$(git rev-parse "origin/$git_branch_name" 2> /dev/null)
  local git_local_commit=$(git rev-parse "$git_branch_name" 2> /dev/null)
  local git_branch_sync_color=$COLOR_GIT_STATUS_DIRTY
  if [[ $git_remote_commit == $git_local_commit ]]; then
    git_branch_sync_color=$COLOR_GIT_STATUS_CLEAN
  fi

  local git_stash=$(git stash list)
  local git_stash_symbol=$GLYPH_GIT_STASH_SYMBOL
  if [[ -z $git_stash ]]; then
    git_stash_symbol=""
  fi

  local git_status=$(git status --porcelain)
  local git_stash_color=$COLOR_GIT_STATUS_DIRTY
  local git_status_color=$COLOR_GIT_STATUS_DIRTY
  if [[ -z $git_status ]]; then
    git_stash_color=$COLOR_GIT_STATUS_CLEAN
    git_status_color=$COLOR_GIT_STATUS_CLEAN
  fi

  local git_repository_path=$(git rev-parse --show-toplevel)
  local git_repository_name=$(basename "$git_repository_path")

  local git_repository_text="%F{${COLOR_GIT_REPOSITORY_TEXT}}${git_repository_name}%f"
  local git_branch_sync_symbol="%F{${git_branch_sync_color}}%B${GLYPH_GIT_BRANCH_SYNC_SYMBOL}%b%f"
  local git_stash_symbol="%F{${git_stash_color}}%B${git_stash_symbol}%b%f"
  local git_status_symbol="%F{${git_status_color}}%B${GLYPH_GIT_STATUS_SYMBOL}%b%f"
  local git_branch_text="%F{${COLOR_GIT_BRANCH_TEXT}}${git_branch_name}%f"

  echo "${git_repository_text} ${git_branch_sync_symbol}${git_stash_symbol}${git_status_symbol} ${git_branch_text}"
}

git_info() {

    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "(${ref#refs/heads/})"
}

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

