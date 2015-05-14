↳ cat ~/.bash_profile
##     ALIAS      ##
####################
alias t="bundle exec testrb"
alias td="tddium run"
alias td_spec="tddium spec"
alias ll="ls -la"
alias unicorn="bundle exec unicorn_rails -c /Users/amartinez/zendesk/zendesk/config/unicorn.rb"
alias debugger="rails s -p 3001 --debugger"
alias sc="rails c"
alias bgrep="bundle exec ruby -e 'puts \$LOAD_PATH' | xargs grep -r"

##   Project shortcuts   ##
###########################

alias zendesk="cd ~/zendesk/zendesk"
alias rosetta="cd  ~/zendesk/rosetta"
alias lotus="cd  ~/zendesk/zendesk_console"
alias carson="cd  ~/zendesk/zendesk_carson"
alias hc="cd  ~/zendesk/help_center"
alias i18n="cd ~/zendesk/zendesk_i18n"
alias crm="cd /Users/amartinez/zendesk/zendesk_crm"

##   Start services   ##
########################

# nginx      --> nginx
# stop nginx --> nginx -s stop
alias memcache="memcached -p 11211 &"
alias redis="redis-server /usr/local/etc/redis.conf"
alias mysql_start="mysql.server start"
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"


##    ENV    ##
###############
export ZENDESK_APP_PATH="/Users/amartinez/zendesk/zendesk"
export ZENDESK_UPSTREAM_PORT="3001"
export PATH="$HOME/.rbenv/bin:/usr/local/Cellar/mysql55/5.5.30/bin/:/Applications/Postgres.app/Contents/Versions/9.4/bin:/opt/local/bin:/usr/bin/mysql:/opt/nginx/sbin:/usr/local/bin:$PATH:/usr/bin:/usr/local/sbin:$HOME/bin:/usr/local/Cellar/mysql55/5.5.30/bin/"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GEM_EDITOR='subl'
export BUNDLER_EDITOR='subl'
export PROMPT_COMMAND='PS1="$(start_of_prompt)$(git_prompt) $(normal_text)$(second_line_prompt)"'
export RBENV_ROOT=/usr/local/var/rbenv
export DOCKER_HOST=tcp://192.168.42.45:2375
#export ZENDESK_HOST=zd-dev.com

##     Others       ##
######################

history -a
eval "$(rbenv init -)"
source /Users/amartinez/zendesk/docker-images/dockmaster/zdi.sh

#Uncomment for HC
#eval "$(~/zendesk/help_center/.hc/bin/hc init -)"


##     Fuctions     ##
######################
function git-find-merge() {
  git rev-list $1..master --ancestry-path | grep -f <(git rev-list $1..master --first-parent) | tail -1
}
function git-show-merge() {
  git show `git rev-list $1..master --ancestry-path | grep -f <(git rev-list $1..master --first-parent) | tail -1`
}

opengem (){
  bundle show $@ | xargs subl;
}

git_prompt (){
        if ! git rev-parse --git-dir > /dev/null 2>&1; then
                return 0
        fi
        git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
        if git diff --quiet 2>/dev/null >&2; then
                git_color="\[\e[0;37m\]"  # git clean
        else
                git_color="\[\e[0;31m\]"  # git dirty
        fi
        echo " \[\e[0;36m\[[$git_color$git_branch\[\e[0;36m\]]"
}

normal_text(){
  echo "\[\033[m\]"
}

start_of_prompt(){
  BOLD="\[\033[1m\]"
  OFF="\[\033[m\]"
  BLUE="\[\e[34;1m\]"
  RED_UNDERLINED="\e[4;31m"
  echo "${RED_UNDERLINED}\u${OFF} in ${BLUE}\W${OFF}"
}

second_line_prompt(){
  ARROW='↳'
  echo "\n${ARROW} "
