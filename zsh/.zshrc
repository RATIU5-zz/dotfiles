PATH="/usr/local/bin:$PATH"

eval "$(starship init zsh)"

source $(brew --prefix nvm)/nvm.sh
source $(brew --prefix nvm)/etc/bash_completion.d/nvm
export NVM_DIR="$HOME/.nvm"


# bun completions
[ -s "/Users/ratiu5/.bun/_bun" ] && source "/Users/ratiu5/.bun/_bun"

# bun
export BUN_INSTALL="/Users/ratiu5/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# ALIASES
alias vim=nvim

# git
alias gap="git add -p"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gp="git push"
alias gpu="git pull"
alias gck="git checkout"

# rust env
#source $HOME/.cargo/env

# homebrew in path
eval $(/opt/homebrew/bin/brew shellenv)

# move annoying .zcompdump files into a better hidden directory
autoload -Uz compinit
compinit -d ~/.config/zsh/.zcompdump

# BEGIN FZF CONFIG

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# zsh-autosuggest config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# END FZF CONFIG
