# Add custom zsh completions
fpath+=~/.zfunc

# Initialize the autocompletion system
autoload -Uz compinit
compinit

# Grab them off of pacman
plugins=(
  zsh-autosuggestions
  zsh-syncax-highlighting
)

. /usr/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

alias ls="ls -l"
alias vi="vim"
alias vim="vim"

# Setup AWS stuff
alias aws="docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli"
export ECR=885729917217.dkr.ecr.eu-north-1.amazonaws.com

