# Z-Shell
if [ -e ~/.zshrc ]; then
  cp ~/.zshrc ~/.zshrc_bak_$(date '+%Y-%m-%d_%H:%M:%S')
fi

# Bash
if [ -e ~/.bash_aliases ]; then
  cp ~/.bash_aliases ~/.bash_aliases_bak_$(date '+%Y-%m-%d_%H:%M:%S')
fi

# Copy the config and
if [ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
 # Aliases are not reloaded on MacOS
  cp ./shell_env/.zshrc ~/.zshrc
  exec zsh
  echo "Z-Shell reloaded!"
elif [ -n "$($SHELL -c 'echo $BASH_VERSION')" ]; then
  cp ./shell_env/.bash_aliases ~/.bash_aliases
  exec bash
  echo "Bash reloaded!"
fi
