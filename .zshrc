export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

alias sql-staging="~/cloud-sql-proxy --auto-iam-authn cashea-358319:us-east1:cashea-staging-db --port=5433"
alias sql-prod="~/cloud-sql-proxy --auto-iam-authn cashea-358319:us-east1:cashea-production-db-clone-2 --port=23003"
alias sql-prod-read="~/cloud-sql-proxy --auto-iam-authn cashea-358319:us-east1:cashea-production-read-replica --port=23003"
alias cz='npx cz'
alias nt='npm run test'
alias nd='npm run start:dev'
alias sn='shutdown -h now'
alias grm='git checkout main && git pull && git checkout -'
alias grs='git checkout staging && git pull && git checkout -'
alias blt='npm run build && npm run lint && npm test'
alias bblt='bun run build && bun run lint && bun run test'
alias cuc='cursor ~/projects/cashea-backend/'
alias cub='cursor ~/Templates/backfill'

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:/home/ale/.local/bin


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


# File system
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias g='git'
alias d='docker'
alias r='rails'
n() { if [ "$#" -eq 0 ]; then nvim .; else nvim "$@"; fi; }

# Git
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# Find packages without leaving the terminal
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# opencode
export PATH=/home/ale/.opencode/bin:$PATH
