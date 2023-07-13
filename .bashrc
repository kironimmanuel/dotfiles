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

# Apps
github() {
   case "$1" in
   "profile")
      start chrome "https://github.com/kironimmanuel"
      ;;
   "repo")
      start chrome "https://github.com/kironimmanuel?tab=repositories"
      ;;
   *)
      start chrome "https://github.com/"
      ;;
   esac

}

youtube() {
   case "$1" in
   "music")
      start chrome "https://www.youtube.com/playlist?list=PL_P2h0WVUVXIZqF62xliZ3cGT2SeVvNNv"
      ;;
   *)
      start chrome "https://youtube.com"
      ;;
   esac
}

email() {
   start "mailto:"
}

# Utils
filesize() {
   du -sh "$1"
}

extract() {
   if [ -f "$1" ]; then
      case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.tar.xz) tar Jxf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
      esac
   else
      echo "'$1' is not a valid file"
   fi
}

weather() {
   local city="$1"
   curl -s "wttr.in/$city"
}
