# PATH="/usr/local/bin:$PATH"


## SHELL ####################################################

# move annoying .zcompdump files into a better hidden directory
autoload -Uz compinit
compinit -d ~/.config/zsh/cache/.zcompdump-$HOST

# source zsh-autosuggestions
# source ~/.config/zsh/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

## HOMEBREW ####################################################

# add homebrew in path
eval $(/opt/homebrew/bin/brew shellenv)

# initialize starship for zsh
eval "$(starship init zsh)"

## ALIASES ####################################################

# git
alias gap="git add -p"
alias gaa="git add *"
alias gcm="git commit -m"
alias gp="git push"
alias gpo="git push origin"
alias gpu="git pull"
alias gck="git checkout"

# directory
alias config='nvim ~/.zshrc'
alias home='cd ~'
alias dev='cd ~/Development'
alias dev2='cd /Volumes/Samsung_T5/Developer'
alias ...='cd .. && cd ..'
alias ..='cd ..'

# nvim
alias vm=nvim
alias vim=nvim

# python
alias python=python3
alias py=python3
alias pip=pip3

# make and enter a directory
mkcd() {
  mkdir "$1"
  cd "$1"
}


## PRETTY ME ####################################################


# Prevent duplicate PATH variables
typeset -U PATH

## ZSH AUTOCOMPLETE ####################################################
#
# zsh-autosuggest config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null


## APP PATHS ####################################################

# bun
[ -s "/Users/ratiu5/.bun/_bun" ] && source "/Users/ratiu5/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# OLD 

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# source $(brew --prefix nvm)/nvm.sh
# source $(brew --prefix nvm)/etc/bash_completion.d/nvm
# export NVM_DIR="$HOME/.nvm"


# bun completions
# [ -s "/Users/ratiu5/.bun/_bun" ] && source "/Users/ratiu5/.bun/_bun"

# bun
# export BUN_INSTALL="/Users/ratiu5/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

# npm
# export PATH="$PATH/.npm-global/bin:$PATH"

# lvim
# export PATH="$HOME/.local/bin:$PATH"

# cargo
# export PATH="$HOME/.cargo/bin:$PATH"


# rust env
#source $HOME/.cargo/env

