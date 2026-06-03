# Your existing PATH exports
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/Users/eli/work/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export LEDGER_FILE=/Users/eli/Documents/finance/2026.journal


# Initialize zplug (NEW ADDITION)
if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh
else
  # Fallback for Homebrew installation
  if (( $+commands[brew] )); then
    export ZPLUG_HOME=$(brew --prefix)/opt/zplug
    source $ZPLUG_HOME/init.zsh
  else
    echo "zplug not found. Install via: brew install zplug"
    return 1
  fi
fi

# Plugins
zplug "dracula/zsh", as:theme

# Install and load plugins (NEW ADDITION)
if ! zplug check; then
  zplug install
fi
zplug load
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/Users/eli/.opencode/bin:$PATH
