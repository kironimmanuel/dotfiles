# Theme
THEME=$HOME/.bash/themes/git_bash_windows_powerline/theme.bash
if [ -f $THEME ]; then
   . $THEME
fi
unset THEME
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

alias ..='cd ..'
alias gs='git status'

print_terminal_banner() {
   # ANSI color codes
   GREEN='\033[0;32m'
   NC='\033[0m' # No color

   # Print the ASCII art in green
   echo -e "${GREEN}"
   cat <<"EOF"
_ _ _ ____ _    ____ ____ _  _ ____ 
| | | |___ |    |    |  | |\/| |___ 
|_|_| |___ |___ |___ |__| |  | |___ 
EOF
   echo -e "${NC}" # Reset the color
}

print_terminal_banner
