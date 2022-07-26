# Source antigen
source /usr/local/share/antigen/antigen.zsh

# Load stuff with antigen
antigen use oh-my-zsh
antigen bundle git

# Setup theme
# @see https://github.com/zsh-users/antigen/issues/675
THEME=denysdovhan/spaceship-prompt
antigen list | grep ${THEME}; if [[ $? -ne 0 ]]; then antigen theme ${THEME}; fi

# Apply antigen
antigen apply

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Spaceship theme options
SPACESHIP_PACKAGE_SHOW=false

# Aliases
alias reload="source ~/.zshrc"
alias cls="clear"

# Python alias
alias python=python3.10
alias py=python3.10
alias pip=pip3

# Exodia aliases and setup
ulimit -n 20000

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
alias clean_lol_rank_crawler="(mix deps.clean parse_trans && mix deps.clean certifi && mix deps.clean connection && mix deps.clean unicode_util_compat && mix deps.clean idna && mix deps.clean hackney && mix deps.get)"
alias toon_world="(cd ~/Code/exodia/apps/toon_world; PORT=4001 MIX_ENV=dev iex --name toon_world@127.0.0.1 --cookie secret_token -S mix phx.server)"
alias pog="(cd ~/Code/exodia/apps/pog; MIX_ENV=dev iex --name pog@127.0.0.1 --cookie secret_token -S mix phx.server)"
alias ra="(cd ~/Code/exodia/apps/ra; MIX_ENV=dev iex --name ra@127.0.0.1 --cookie secret_token -S mix phx.server)"
alias lol_rank_crawler="(cd ~/Code/exodia/apps/lol_rank_crawler; MIX_ENV=dev iex --name lol_rank_crawler@127.0.0.1 --cookie secret_token -S mix)"
alias page_cache="(cd ~/Code/exodia/apps/page_cache; PORT=4005 MIX_ENV=dev iex --name page_cache@127.0.0.1 --cookie secret_token -S mix)"
alias sqs_reader="(cd ~/Code/exodia/apps/sqs_reader; MIX_ENV=dev iex --name sqs_reader@127.0.0.1 --cookie secret_token -S mix phx.server)"
alias dev_db="(psql -h database-cluster-1.cluster-cfz6k4djwolv.us-east-1.rds.amazonaws.com -p 5432 -d postgres -U postgresaurora -W postgresaurora)"
alias guides_dev_db="(psql -h dev-guides-aurora.cluster-cfz6k4djwolv.us-east-1.rds.amazonaws.com -d postgres -U postgres -W postgres)"

# Git options
GIT_COMPLETION_CHECKOUT_NO_GUESS=1
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
