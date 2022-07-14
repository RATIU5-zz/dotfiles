PATH="/usr/local/bin:$PATH"

eval "$(starship init zsh)"

# bun completions
[ -s "/Users/ratiu5/.bun/_bun" ] && source "/Users/ratiu5/.bun/_bun"

# bun
export BUN_INSTALL="/Users/ratiu5/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

