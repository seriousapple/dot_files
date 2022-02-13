source ~/00files/dot_files/aliases
source ~/00files/dot_files/ssh-ps1

# prompt
PS1="\[$(tput setaf 5)\]\w\n"; # path
PS1+="\[${hostStyle}\]\u"; # host
PS1+="\[$(tput setaf 15)\]@"; # @
PS1+="\[$(tput setaf 11)\]\h"; # user 
PS1+="\[$(tput setaf 15)\]$ "; # $
PS1+="\[$(tput sgr0)\]" # end

export PS1;
export BASH_SILENCE_DEPRECATION_WARNING=1; #macos only

