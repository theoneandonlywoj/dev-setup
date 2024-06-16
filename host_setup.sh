# Z-Shell
cp ~/.zshrc ~/.zshrc_bak_$(date '+%Y-%m-%d_%H:%M:%S')
cp ./shell_env/.zshrc ~/.zshrc

# Aliases are not reloaded on MacOS
exec zsh
