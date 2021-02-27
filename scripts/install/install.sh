#!/bin/sh

DEVELOPMENT_APPS="vim tmux python3-pip"

# echo "Getting the latest updates..."
# sudo apt update
read -p "Would you like to install development tools? [Y/N] " response
if [ $response = "Y" ] || [ $response = "y" ]; then
  echo "Installing development tools..."
  sudo apt install -y $DEVELOPMENT_APPS
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  pip install --upgrade pip
  pip install wheel
  echo "Done"
  echo "(Note: Make sure to open up a new tmux shell, and do: \`[prefix] Shift+I\` to install plugins)"
fi

read -p "Would you like to copy config scripts (.vimrc, bashrc, etc.)? [Y/N] " response

if [ $response = "Y" ] || [ $response = "y" ]; then
  cd ../../config_files/
  cp -r . ~/
  cd ../appearance/colorschemes
  mkdir ~/.vim
  mkdir ~/.vim/colors
  cp atlantis.vim ~/.vim/colors
  cp personal.vim ~/.vim/colors
  echo "Done"
fi

