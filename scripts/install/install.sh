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
  echo "Done"
fi

read -p "Would you like to copy appearance files (colorschemes, terminal profile, etc.)? [Y/N] " response

if [ $response = "Y" ] || [ $response = "y" ]; then
  cd ../appearance/colorschemes
  mkdir ~/.vim
  mkdir ~/.vim/colors
  cp atlantis.vim ~/.vim/colors
  cp personal.vim ~/.vim/colors
  cd ../
  # Load the terminal profile colorscheme
  dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < terminal-profile.dconf
  # Install paper icons
  sudo add-apt-repository -u ppa:snwh/ppa
  sudo apt install paper-icon-theme
  # Install arc-dark theme; do this last probably
  git clone https://github.com/horst3180/arc-theme ~/Downloads --depth 1 && cd ~/Downloads/arc-theme
  ./autogen.sh --prefix=/usr
  sudo make install
  echo "Done"
fi
