source ~/00files/dot_files/aliases
source ~/00files/dot_files/ssh-ps1
source ~/00files/local/en-vars

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

# BEGIN_KITTY_SHELL_INTEGRATION
# if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
