autoload -Uz colors && colors
setopt PROMPT_SUBST

# Don't ask if user is sure when running rm with wildcards (like bash)
setopt rmstarsilent

# If wildcard pattern has no matches, return an empty string (like bash)
setopt no_nomatch

# Specify the history file and its sizes
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# These options improve history behavior across sessions
setopt SHARE_HISTORY          # Share command history across all open sessions
setopt APPEND_HISTORY         # Append history rather than overwriting it
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks from each command line being added to the history list
setopt HIST_IGNORE_SPACE      # Ignore commands that start with a space (for secret or experimental commands)
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when trimming history

# Load dotfiles:
for file in ~/.{zprompt,aliases,private}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Created by pipx
export PATH="$PATH:$HOME/.local/bin"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# fpath+=~/.zfunc
# autoload -Uz compinit && compinit
# fpath+=/opt/homebrew/share/zsh/site-functions
# autoload -Uz compinit && compinit

#DATABRICKS_CLI_DO_NOT_EXECUTE_NEWER_VERSION=1

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraformexport PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit && compinit
