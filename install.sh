#!/bin/sh

DEVELOPMENT_APPS="vim vim-gtk3 tmux python3 python3-pip curl autoconf libgtk-3-dev automake gnome-tweaks"
SCRIPTPATH=`pwd`

response=
read -p "Would you like to fetch the latest updates? [Y/N] " response
if [[ ${response,,} = "y" ]]; then
  echo "Getting the latest updates..."
  sudo apt update
  echo "Done"
fi

# git is necessary, need to install it
sudo apt install git

read -p "Would you like to copy config scripts (.vimrc, bashrc, etc.) and appearance files (colorschemes)? [Y/N] " response
if [[ ${response,,} = "y" ]]; then
  if ! grep -Fxq "set completion-ignore-case On" /etc/inputrc; then
    echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
  fi
  cd config_files/
  cp -r . ~/
  cd ..
  script="y"
  if [ -d ~/scripts ]; then
    echo "scripts directory already present."
    read -p "Would you like to copy the scripts over anyway (THIS WILL REPLACE THE CURRENT SCRIPTS)? [Y/N] " script
  else
    mkdir ~/scripts
  fi
  if [[ ${script,,} = "y" ]]; then
    cd scripts/
    cp -r . ~/scripts
    cd ..
  fi

  # VIM COLORSCHEMES
  cd appearance/colorschemes
  [ -d ~/.vim ] && echo ".vim directory already present." || mkdir ~/.vim
  [ -d ~/.vim/colors ] && echo "vim colors directory already present." || mkdir ~/.vim/colors
  [ -f ~/.vim/colors/atlantis.vim ] && echo "atlantis colorscheme already present." || cp atlantis.vim ~/.vim/colors
  [ -f ~/.vim/colors/personal.vim ] && echo "personal colorscheme already present." || cp personal.vim ~/.vim/colors

  # VUNDLE
  if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "vundle directory already present."
  else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    echo "vundle plugins installed successfully"
  fi

  # TERMINAL PROFILE
  cd ..
  dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < terminal-profile.dconf
  cd ..
  echo "Done"
fi

read -p "Would you like to install development tools? [Y/N] " response
if [[ ${response,,} = "y" ]]; then
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
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
      tpm=true
  fi
  pip3 install --upgrade pip
  echo "Done"
  if [ $tpm = "true" ]; then
    echo "(Note: Make sure to open up a new tmux shell, and do: \`[prefix] Shift+I\` to install plugins)"
  fi
fi

read -p "Would you like to install system themes/appearence? [Y/N] " response
if [[ ${response,,} = "y" ]]; then
  # SYSTEM ICON THEMES (PAPER)
  paper_ppa=snwh
  if ! grep -q "^deb .*$paper_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
      # commands to add the ppa ...
      sudo add-apt-repository -u ppa:snwh/ppa
      sudo apt install paper-icon-theme
  else
    echo "paper repository already present"
  fi

  # Install arc-dark theme
  if [ -d ~/Downloads/arc-theme ]; then
    echo "arc-theme directory already present."
  else
    git clone https://github.com/horst3180/arc-theme ~/Downloads/arc-theme --depth 1
    cd ~/Downloads/arc-theme
    ./autogen.sh --prefix=/usr --with-gnome=3.22
    sudo make install
    echo "arc-theme installed. Make sure to open up gnome-tweaks and set the theme accordingly."
  fi
  echo "Done"
fi

read -p "Would you like to setup git configs (name, default editor, etc)? [Y/N] " response
if [[ ${response,,} = "y" ]]; then
  read -p "Email: " email
  read -p "Name: " name
  git config --global user.email $email
  git config --global user.name $name
  git config --global core.editor "vim"
  echo "Done."
fi


# Return back to the script directory
cd $SCRIPTPATH

