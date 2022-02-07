export VISUAL=vim;
export EDITOR=vim;
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

# aliases
alias la='ls -alh'
alias tmuxa='tmux attach-session -t'
alias y4='youtube-dl -f mp4'

# OS specific
case "$(uname -s)" in
    
    Darwin)
        alias ls='ls -G' # ls color for macos
        alias zss='vim ~/.zshrc'

        ;;
    Linux)
        alias ls='ls --color' # ls color for linux
        alias pcmi='sudo pacman -Sy'
        alias pcms='sudo pacman -Ss'
        alias vi3='vim ~/.config/i3/config'
        alias vpb='vim ~/.config/polybar/config.ini'

        ;;
    *)
        #other os
        ;;
esac


export PS1;
export BASH_SILENCE_DEPRECATION_WARNING=1;

#scripts dir
export PATH=$PATH:~/00files/dot_files/scripts
