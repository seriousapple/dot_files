source ~/00files/dot_files/aliases
source ~/00files/dot_files/ssh-ps1
source ~/00files/local/en-vars

#vi mode
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

#history

if [ ! -d "${HOME}/.cache/bash" ]; then
  mkdir -p "${HOME}/.cache/bash";
fi

if [ ! -d "${HOME}/.cache/bash/bash_history" ]; then
  touch "${HOME}/.cache/bash/bash_history";
fi

export HISTFILE=~/.cache/bash/bash_history
HISTTIMEFORMAT="%Y-%m-%d %T "

# prompt
PS1="\[$(tput setaf 5)\]\w\n"; # path
PS1+="\[${hostStyle}\]\u"; # host
PS1+="\[$(tput setaf 15)\]@"; # @
PS1+="\[$(tput setaf 11)\]\h"; # user 
PS1+="\[$(tput setaf 15)\]$ "; # $
PS1+="\[$(tput sgr0)\]" # end

export PS1;
export BASH_SILENCE_DEPRECATION_WARNING=1; #macos only

