export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  bundler
  dotenv
  macos
  rake
  ruby
  npm
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
export EDITOR=nvim

##############################
#          ALIAS             #
##############################

# ColorLS (ruby gem) gem install colorls
# ----------------------------
# alias ls='colorls --sort-dirs'
# alias lsa='colorls -A --sort-dirs'
# alias lst='colorls --tree --light'
# alias lst2='colorls --tree=2'
# alias lst3='colorls --tree=3'

# Config files
# ----------------------------
alias zshc='nvim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias nvc='nvim ~/.config/nvim/init.lua'
alias tmc='nvim ~/.tmux.conf'
alias kc='nvim ~/.config/kitty/kitty.conf'

# FZY
# ----------------------
alias fzy='find . -type f | fzy'

# git aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit -m'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gcl='git clone $1'
alias gd='git diff'
alias gda='git diff HEAD'
alias gho='git hash-object'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge'
alias gmnff='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp="git push"
alias gpu="git push -u"
alias gpull='git pull'
alias gpullr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

alias grao="git remote add origin"
alias gpuo="git push -u origin"
alias grsu="git remote set-url"

alias gphm='git push heroku master && heroku run rake db:migrate && heroku restart'
#-----------------
# Git Functions
#-----------------

#------- Git log find by commit message
function glf() { git log --all --grep="$1"; }

#------- Initial Git Commit
function gic() { git add . && git commit -m "initial commit";}

#------- Git Merge => Master
function gmerge() { git checkout master && git merge $1 && git push;}

#------- Git commit & push to branch
function gcpu() { git add . && git commit -m "$1" && git push -u origin $2;}

#------- Git commit & upstream push
function gacp() { git add . && git commit -m "$1" && git push;}

#------- Git add remote && push
function grap() { git remote add origin $1 && git push -u origin master;}

#     Postgresql
# alias pgstart='sudo service postgresql start'
# alias pgstop='sudo service postgresql stop'

alias pgstart='brew services start postgresql'
alias pgstop='brew services stop postgresql'
alias redisstart='brew services start redis'
alias redisstop='brew services stop redis'
#alias startservices='brew services start redis && brew services start postgresql@15'
#alias stopservices='brew services stop redis && brew services stop postgresql@15'
alias startservices='brew services start redis && brew services start postgresql@14'
alias stopservices='brew services stop redis && brew services stop postgresql@14'

#     Python
# ----------------------------
alias python='python3'

#     Rails
# ----------------------------
alias rs='rails s'
alias rc='rails c'
alias rt='rails test'

#---- Bundle Alias
alias bi='bundle install'
alias biwp='bundle install --without production'
alias bu='bundle update'

#---- Database Alias ---------
alias rdbmig='rails db:migrate'
alias rdbseed='rails db:seed'

#---- Devise Setup Alias
alias rgdi='rails g devise:install'
alias rgdv='rails g devise:views'
alias rgdu='rails g devise user'

#---- Generator Alias --------
alias rgc='rails g controller'
alias rgma='rails g mailer'
alias rgmi='rails g migration'
alias rgmo='rails g model'
alias rgr='rails g resource'
alias rgs='rails g scaffold'

#---- Rails Kill Server----------
alias search='lsof -wni tcp:3000'
alias search1='lsof -wni tcp:5432'
alias destroy='kill -9 $1'

#---- Rails Routes Alias -------
alias rr='rails routes'
alias rrg='rails routes | grep $1'

#---- Webpacker Alias
alias rwi='rails webpacker:install:$1'
alias webds='bin/webpack-dev-server'

#-----------------
# Rails Functions
#-----------------

#------- Rails new, change into directory, and open code-insiders
#function rnapp() { rails new $1 && cd $1 && code-insiders .;}
function rrpapp() { rails new $1 -BT -d=postgresql --webpacker=react && cd $1 && rails db:create && nvim Gemfile ;}

#------- Rails new, change into directory, and open code-insiders (same window)
function rnappr() { rails new $1 && cd $1 && code-insiders . -r;}

#------- Rails generate scaffold and db:migrate
function rgsm() { rails g scaffold $1 && rails db:migrate; }

#------- Rails new, change into directory, and open code-insiders
function rntapp() { rails new $1 && cd $1 && guard init && bundle binstubs guard && rails g rspec:install && bundle binstubs rspec-core && cucumber --init && nvim;}
#Rails new, change into directory, install webpacker, and open code-insiders

#Rails 6 Javascript setup
function setjs() { mkdir app/javascript/scss app/javascript/js app/javascript/images && touch app/javascript/js/site.js app/javascript/scss/site.scss && mv app/javascript app/webpacker }

#------- Rails test function
function rnapp-() { rails new $1 --database=postgresql --skip-test --skip-action-cable --skip-active-storage --skip-turbolinks --skip-yarn && cd $1 && code-insiders .;}

#------- Devise Setup Functions
function deviseuserview(){ rails g devise:install && rails g devise:views && rails g devise User }
function deviseuser(){ rails g devise:install && rails g devise User }
function deviseview(){ rails g devise:install && rails g devise:views }

#-------------------------------
# Ruby/Rails Testing Functions
#-------------------------------

# Sidekiq
#-------------------------------
alias sidekiq='bundle exec sidekiq'

# Matestack UI
#-------------------------------
alias matestack='bundle add matestack-ui-core && yarn add matestack-ui-core'

#------- Testing Initialization
function rinit() { rails g rspec:install && bundle binstubs rspec-core }
function ginit() { guard init && bundle binstubs guard }
function cinit() { cucumber --init }
function testing() { guard init && bundle binstubs guard && rails g rspec:install && bundle binstubs rspec-core && cucumber --init }

#     Redis
#alias redisstart='sudo service redis-server start'
#alias redisstop='sudo service redis-server stop'

#     Tagrity
# ----------------------------
# (tagrity revive &) &> /dev/null

#     Terminal Functions
# ----------------------------

#------- make directory and change directory
function mkcd() { mkdir $1 && cd $1;}

#------- Create new folder for front end development (Code-Insiders editor)
function cifront() { mkcd $1 && touch index.html gulpfile.js index.js style.sass && mkdir img && npm init -y && git init && code-insiders . ; }

#------- Create new folder for front end development (NVIM editor)
function nvfront() { mkcd $1 && touch index.html gulpfile.js index.js style.sass && mkdir img && npm init -y && git init && nvim index.html ; }

function fe() { mkdir $1 && cd $1 && touch index.html style.sass && git init && ci .;}

# React Commands
# ----------------------------
function cra() { create-react-app $1 && cd $1 }

# Tmux Commands
# ----------------------------
# alias t='env TERM=screen-256color tmux'
alias tx='tmuxinator'
alias tls='tmux list-sessions'
alias tas='tmux attach -t $1'
alias tns='tmux new-session -s $1'
alias tks='tmux kill-session -t $1'
alias tk='tmux kill-server'

# Windows Terminal
# ----------------------------
# export WT='cd ../../mnt/c/Users/smith/Local\ Settings/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/'
alias wt='cd ../../mnt/c/Users/smith/Local\ Settings/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/'

# WSL
# ----------------------------
# alias goto='wslview $1'
# alias clean='sudo make distclean'
# alias minstall='sudo make CMAKE_BUILD_TYPE=Release install'

# VIM
# ----------------------------
alias v='nvim'
alias nv='nvim'
alias vim='$HOME/.config/nvim'
alias vimc='$HOME/.config/nvim/lua/smithwebdev/plugins/config'
alias vimp='$HOME/.config/nvim/lua/smithwebdev/plugins'
alias vims='$HOME/.config/nvim/lua/smithwebdev'

#VSCode Extensions dir
# ----------------------------
alias codex='mnt/c/Users/smith/.vscode/extensions'

alias ctag='ctags -R -f .gitignore/tags --exclude=.git --exclude=log .tags'
alias rtag='ctags -R --output-format=json --languages=ruby --exclude=.git --exclude=log -f $(bundle list --paths) .tags'
alias jtag='ctags -R --output-format=json --languages=javascript --exclude=.git --exclude=log -f .tags'
# alias explorer="explorer.exe ."
# alias vivaldi="vivaldi.exe"

function zgi() {echo "sudo apt-get install $1" >> ~/Setup/linux.txt && sudo apt-get install $1}
function zi() {echo "sudo apt install $1" >> ~/Setup/linux.txt && sudo apt install $1}
function zu() {echo "sudo apt-get update" >> ~/Setup/linux.txt && sudo apt-get update}
function zr() {echo "sudo add-apt-repository $1" >> ~/Setup/linux.txt && sudo add-apt-repository}

export PATH="$HOME/.local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

# export VIMA="$HOME/.config/nvim/lua/smithwebdev/core/autocmds.lua"
# export VIMC="$HOME/.config/nvim/lua/smithwebdev/plugins/config/init.lua"
# export VIME="$HOME/.config/nvim/lua/smithwebdev/plugins/config/"
# export VIMI="$HOME/.config/nvim/init.lua"
# export VIML="$HOME/.config/nvim/lua/smithwebdev/plugins/config/lsp/init.lua"
# export VIMM="$HOME/.config/nvim/lua/smithwebdev/core/keymaps.lua"
# export VIMP="$HOME/.config/nvim/lua/smithwebdev/plugins/init.lua"
# export VIMS="$HOME/.config/nvim/lua/smithwebdev/core/settings.lua"
# export VIMU="$HOME/.config/nvim/lua/smithwebdev/core/utils.lua"

#export TERM=xterm-256color-italic
#export TERM=screen-256color

# alias settings='cd ../../mnt/c/Users/smith/Local\ Settings/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState'
# alias desktop='cd ../../mnt/c/Users/smith/Desktop'

####  FIG ENV VARIABLES ####
# [ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
#export DISPLAY=$(ip route list default | awk '{print $3}'):0
#export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
#export LIBGL_ALWAYS_INDIRECT=1
#
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/swd/.bun/_bun" ] && source "/Users/swd/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/swd/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "$HOME/.cargo/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
