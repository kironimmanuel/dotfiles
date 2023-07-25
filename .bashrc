# Environment variables

# Theme
THEME=$HOME/.bash/themes/git_bash_windows_powerline/theme.bash
if [ -f $THEME ]; then
   . $THEME
fi
unset THEME
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

echo "To view all available commands, type 'commands'"

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dev='cd /c/dev'
alias desk='cd ~/Desktop'
alias bashconfig='code ~/.bashrc'
alias gs='git status'
alias password='bash "c:/dev/bash/password-manager/password-manager.sh"'

# Help
commands() {
   echo "Common commands:"
   echo "  commands                 - View all available commands"

   echo
   echo "Navigation/Utilities:"
   echo "  ..                       - Navigate up one directory"
   echo "  ...                      - Navigate up two directories"
   echo "  ....                     - Navigate up three directories"
   echo "  mkcd [filename]          - Make directory and navigate to it"
   echo "  dev                      - Navigate to dev directory"
   echo "  desk                     - Navigate to desktop"
   echo "  filesize [filename]      - Get filesize"
   echo "  extract [filename]       - Extract file"
   echo "  genpass                  - Generate password"
   echo "  gensshkey                - Generate secure SSH key pair"
   echo "  weather                  - Get weather"
   echo "  speedtest                - Run speedtest"
   echo "  bashconfig               - Open .bashrc file"

   echo
   echo "Online Services:"
   echo "  email                    - Open email"
   echo "  github [profile|repo]    - Open GitHub"
   echo "  youtube [music]          - Open YouTube"

   echo
   echo "Security/Management:"
   echo "  password                 - Open password manager"

   echo
}

# Online Services
google() {
   searchterm=$(echo $* | tr ' ' '+')
   curl -s "https://www.google.com/search?q=${searchterm}"
}

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

# Utilities
mkcd() {
   mkdir -p "$@" && cd "$@"
}

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

genpass() {
   # openssl rand -base64 16 | tr -d '/+=' | cut -c1-16
   LC_ALL=C tr -dc 'A-Za-z0-9!@#$%^&*()' </dev/urandom | head -c 16
   echo
}

gensshkey() {
   ssh-keygen -t rsa -b 4096
}

weather() {
   local city="$1"
   curl -s "wttr.in/$city"
}

speedtest() {
   curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}

# Load Angular CLI autocompletion.
source <(ng completion script)
