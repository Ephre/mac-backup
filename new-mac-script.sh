#!/bin/bsh

# To Do
# Implement preferences & plugins fort zsh (git terraform python kops kubectl) into ~/.zshrc
# Add in Hyper preferences and plugins

# Installs Zsh shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Checks to see if Homebrew is installed & installs if not present
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Updates homebrew recipes
echo "Updating homebrew..."
brew update

# Installs Powerline10k
brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

# Installs zsh syntax highlighting
run "brew install zsh-syntax-highlighting"
echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >>! ~/.zshrc

# Installs git
echo "Installing Git..."
brew install git
git config --global core.editor "code --wait"

# Configures git to your user
echo "Git config"
git config --global user.name "Ephre"
git config --global user.email jamesdefty@gmail.com

echo "Installing other brew packages..."
brew install pyenv
pyenv install 3.7.4
echo 'if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi' >>! ~/.zshrc
brew install docker
brew install tfenv
tfenv install 0.11.14
brew install awscli
brew install kubectl
brew install kubectx
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/ed9dcb2cb455a816f744c3ad4ab5c18a0d335763/Formula/kubernetes-helm.rb





echo "Please remember to run 'p10k configure' to set-up powerline10k!"