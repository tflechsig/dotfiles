#Installation
echo 'alias gid="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> .bashrc
source ~/.bashrc
git clone --bare https://github.com/tflechsig/dotfiles.git $HOME/.dotfiles.git
gid checkout
gid config --local status.showUntrackedFiles no

