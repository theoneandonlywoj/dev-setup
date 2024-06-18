docker run -v ~/.gitconfig:/etc/gitconfig --mount src=$(pwd),target=/__project/,type=bind --name playground -dit --rm playground 
