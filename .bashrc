# colors
bold=$(tput bold);
black=$(tput setaf 0);
white=$(tput setaf 15);
cyan=$(tput setaf 6);
yellow=$(tput setaf 11);
red=$(tput setaf 1);
purple=$(tput setaf 5);

# prompt
PS1="\[${purple}\]\w\n"; # path
PS1+="\[${cyan}\]\u"; # host
PS1+="\[${white}\]@"; # @
PS1+="\[${yellow}\]\h"; # user 
PS1+="\[${white}\]$ "; # $
PS1+="\[$(tput sgr0)\]" # end

# SSH
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}";
else
	hostStyle="${cyan}";
fi;

export PS1;
