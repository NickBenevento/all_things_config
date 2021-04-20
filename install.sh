#!/bin/sh

# To do:
# Make autocomplete case insensitive
# Fix directory navigation (absolute paths or something)
# fix arc-theme installation

DEVELOPMENT_APPS="vim tmux python3 python3-pip autoconf libgtk-3-dev automake"

read -p "Would you like to fetch the latest updates? [Y/N] " response
if [ $response = "Y" ] || [ $response = "y" ]; then
  echo "Getting the latest updates..."
  sudo apt update
  echo "Done"
fi

read -p "Would you like to copy config scripts (.vimrc, bashrc, etc.)? [Y/N] " response
if [ $response = "Y" ] || [ $response = "y" ]; then
  echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
  cd config_files/
  cp -r . ~/
  cd ..
  echo "Done"
fi

read -p "Would you like to setup git configs (name, default editor, etc)? [Y/N] " response
if [ $response = "Y" ] || [ $response = "y" ]; then
  read -p "Email: " email
  read -p "Name: " name
  git config --global user.email $email
  git config --global user.name $name
  git config --global core.editor "vim"
  echo "Done."
fi

read -p "Would you like to install development tools? [Y/N] " response
if [ $response = "Y" ] || [ $response = "y" ]; then
  echo "Installing development tools..."
  sudo apt install -y $DEVELOPMENT_APPS
  source ~/.bashrc
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  pip install --upgrade pip
  pip install wheel
  echo "Done"
  echo "(Note: Make sure to open up a new tmux shell, and do: \`[prefix] Shift+I\` to install plugins)"
fi

read -p "Would you like to copy appearance files (colorschemes, terminal profile, etc.)? [Y/N] " response
if [ $response = "Y" ] || [ $response = "y" ]; then
  cd appearance/colorschemes
  mkdir ~/.vim
  mkdir ~/.vim/colors
  cp atlantis.vim ~/.vim/colors
  cp personal.vim ~/.vim/colors
  cd ..
  # Load the terminal profile colorscheme
  dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < terminal-profile.dconf
  cd ..
  # Install paper icons
  sudo add-apt-repository -u ppa:snwh/ppa
  sudo apt install paper-icon-theme
  # Install arc-dark theme; do this last probably
  git clone https://github.com/horst3180/arc-theme ~/Downloads/arc-theme --depth 1 && cd ~/Downloads/arc-theme
  ./autogen.sh --prefix=/usr
  sudo make install
  echo "Done"
fi

