# Theme
THEME=$HOME/.bash/themes/git_bash_windows_powerline/theme.bash
if [ -f $THEME ]; then
   . $THEME
fi
unset THEME
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
