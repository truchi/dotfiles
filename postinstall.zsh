# Install submodule
git submodule update --init --recursive

# Rebuild font cache
fc-cache -f ~/.fonts

# Install fasd
# cd ~/.dotfiles/zsh/5-navigation/fasd/ && make install