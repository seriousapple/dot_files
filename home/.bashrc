source ~/00files/dot_files/aliases

# colors
bold=$(tput bold);
black=$(tput setaf 0);
white=$(tput setaf 15);
cyan=$(tput setaf 6);
yellow=$(tput setaf 11);
red=$(tput setaf 1);
purple=$(tput setaf 5);

# SSH
if [[ "${SSH_TTY}" ]]; then
    hostStyle="${bold}${red}";
else
    hostStyle="${cyan}";
fi;

# prompt
PS1="\[${purple}\]\w\n"; # path
PS1+="\[${hostStyle}\]\u"; # host
PS1+="\[${white}\]@"; # @
PS1+="\[${yellow}\]\h"; # user 
PS1+="\[${white}\]$ "; # $
PS1+="\[$(tput sgr0)\]" # end

export PS1;
export BASH_SILENCE_DEPRECATION_WARNING=1;

