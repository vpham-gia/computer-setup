echo "Initialization of Mac setup"
echo "-----------------------------------------------------"

echo "Installing Xcode Command Line Tools .."
xcode-select --install
echo ".. Done"
echo "-----------------------------------------------------"

echo "Installing Homebrew .."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo ".. Done"

echo "-----------------------------------------------------"

echo "Creating .bash_profile and .bash_aliases .."
cd ~/
touch .bash_aliases
echo "alias ll='ls -la'" >> .bash_aliases
echo "alias python='python3'" >> .bash_aliases
echo "" >> .bash_aliases
echo "alias projects_code='cd ~'" >> .bash_aliases
touch .bash_profile
echo "source ~/.bash_aliases" >> .bash_profile
echo "export LC_ALL=en_US.UTF-8" >> .bash_profile
echo ".. Done"

echo "-----------------------------------------------------"

echo "Installing python 3 .."
brew install python3
echo ">> Python 3 version is: "
python3 --version
pip3 install pandas
echo ".. Done"

echo "-----------------------------------------------------"

echo "Installing iterm2 .."
brew install --cask iterm2
echo ".. Done"

echo "-----------------------------------------------------"

echo "Installing zsh and configuring iterm .."
brew install zsh
chsh -s /bin/zsh
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
echo "source ~/.bash_profile" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zshrc
echo "POWERLEVEL9K_PROMPT_ADD_NEWLINE=true" >> ~/.zshrc
echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)" >> ~/.zshrc
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv pyenv)" >> ~/.zshrc
git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k
echo 'source  ~/powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc
echo "" >> ~/.zshrc
brew install zsh-syntax-highlighting
echo 'source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
echo ".. Done"

echo "-----------------------------------------------------"

echo "Installing poetry .."
brew install poetry
source .bash_profile
echo ">> Poetry version:"
poetry --version
echo "-----------------------------------------------------"
poetry config virtualenvs.in-project true
echo ">> Poetry configuration:"
poetry config --list
echo "-----------------------------------------------------"
echo "" >> .bash_profile
echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> .bash_profile
echo "..Done"

echo "-----------------------------------------------------"

echo "Installing pyenv .."
brew install pyenv
echo "" >> .bash_profile
echo 'eval "$(pyenv init --path)"' >> .bash_profile
echo "..Done"

echo "-----------------------------------------------------"

echo "End of Mac setup"
