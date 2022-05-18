source "$HOME/.cargo/env"

eval "$(bw completion --shell zsh); compdef _bw bw;"
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
