#!/usr/bin/env bash

set -x

apt-get update
apt-get install -y \
  autoconf \
  checkinstall \
  git \
  gcc \
  libncurses5 \
  libncurses5-dev \
  linux-headers-$(uname -r) \
  make \
  python3 \
  python3-dev \
  sudo

echo Install Docker
apt-get update
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg2 \
  software-properties-common
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) \
  stable"
apt-get update
apt-get install -y docker-ce

echo Install vim with python support
apt-get purge -y vim vim-* xxd && apt autoremove
git clone https://github.com/vim/vim.git
cd vim
./configure --prefix=/usr --enable-python3interp
#./configure --with-features=huge \
#            --enable-multibyte \
#            --enable-pythoninterp \
#            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
#            --prefix=/usr
#make VIMRUNTIMEDIR=/usr/share/vim/vim74
make
checkinstall -y --install --pkgname vim
#mkdir .vim
#cd .vim
#git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
#git clone https://github.com/scrooloose/nerdtree.git bundle/nerdtree

echo Install pip, powerline
cd ~
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
echo Install powerline
pip install powerline-status

echo Install i3-gaps
cd ~
apt-get install -y \
  libxcb-keysyms1-dev \
  libpango1.0-dev \
  libxcb-util0-dev \
  xcb \
  libxcb1-dev \
  libxcb-icccm4-dev \
  libyajl-dev \
  libev-dev \
  libxcb-xkb-dev \
  libxcb-cursor-dev \
  libxkbcommon-dev \
  libxcb-xinerama0-dev \
  libxkbcommon-x11-dev \
  libstartup-notification0-dev \
  libxcb-randr0-dev \
  libxcb-xrm0 \
  libxcb-xrm-dev
git clone https://github.com/Airblader/i3.git i3-gaps
cd i3-gaps
git checkout 4.15.0.1
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
checkinstall -y --install --pkgname i3-gaps
apt-get install -y i3status
#sudo cpan -i AnyEvent::I3

#lemonbar
#cd ~
#apt-get install -y \
#  libx11-xcb-dev \
#  libxcb-randr0-dev \
#  libxcb-xinerama0-dev
#git clone https://github.com/LemonBoy/bar.git lemonbar
#cd lemonbar
#git checkout v1.3
#make
#checkinstall -y --install --pkgname lemonbar
#needs more config

#extras
apt-get install -y \
  compton \
  conky \
  dmenu \
  mc \
  ranger \
  terminator \
  tmux
wget https://github.com/powerline/fonts/raw/master/Hack/Hack-Regular.ttf
mv Hack-Regular.ttf /usr/share/fonts/

#emacs, latex
#apt-get install -y emacs imagemagick dvipng texlive
