docker run -v ~/.gitconfig:/etc/gitconfig --mount src=$(pwd),target=/__project/,type=bind --mount src=$HOME/Desktop/Repos/Second-Brain,target=/root/Second-Brain,type=bind --name playground -dit --rm playground 
