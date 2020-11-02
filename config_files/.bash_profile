# export PATH="$HOME/.poetry/bin:$PATH"
EDITOR=`which vim`
source ~/.bashrc
source ~/.profile
# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# BEGIN ANSIBLE MANAGED BLOCK
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# END ANSIBLE MANAGED BLOCK

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
