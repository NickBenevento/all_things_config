#!/bin/sh

# To do:
# Make autocomplete case insensitive
# Fix directory navigation (absolute paths or something)
# fix arc-theme installation

DEVELOPMENT_APPS="vim tmux python3 python3-pip curl autoconf libgtk-3-dev automake"
SCRIPTPATH=`pwd`

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
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python3 get-pip.py
  rm get-pip.py
  source ~/.bashrc
  tpm=false
  if [ -d ~/.tmux/plugins/tpm/ ]; then
    echo "Tmux tpm already installed."
  else
      tpm=true
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  pip3 install --upgrade pip
  echo "Done"
  if [ $tpm = "true" ]; then
    echo "(Note: Make sure to open up a new tmux shell, and do: \`[prefix] Shift+I\` to install plugins)"
  fi
fi

read -p "Would you like to copy appearance files (colorschemes, terminal profile, etc.)? [Y/N] " response
if [ $response = "Y" ] || [ $response = "y" ]; then
  cd appearance/colorschemes
  [ -d ~/.vim ] && echo ".vim directory already present." || mkdir ~/.vim
  [ -d ~/.vim/colors ] && echo "vim colors directory already present." || mkdir ~/.vim/colors
  [ -f ~/.vim/colors/atlantis.vim ] && echo "atlantis colorscheme already present." || cp atlantis.vim ~/.vim/colors
  [ -f ~/.vim/colors/personal.vim ] && echo "personal colorscheme already present." || cp personal.vim ~/.vim/colors
  cd ..
  # Load the terminal profile colorscheme
  dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < terminal-profile.dconf
  cd ..
  # Install paper icons
  sudo add-apt-repository -u ppa:snwh/ppa
  sudo apt install paper-icon-theme
  # Install arc-dark theme; do this last probably
  arctheme = "y"
  if [ -d ~/Downloads/arc-theme ]; then
    echo "arc-theme directory already present."
    read -p "Would you like to still install arc-theme? [Y/N] " arctheme
  else
    git clone https://github.com/horst3180/arc-theme ~/Downloads/arc-theme --depth 1
  fi
  if [ $arctheme = "Y" ] || [ $arctheme = "y" ]; then
    cd ~/Downloads/arc-theme
    ./autogen.sh --prefix=/usr --with-gnome=3.22
    sudo make install
  fi
  echo "Done"
fi

# Return back to the script directory
cd $SCRIPTPATH

