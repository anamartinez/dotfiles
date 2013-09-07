alias tr="bundle exec testrb -ltest"
alias ttr="bundle exec ruby -Itest"
alias td="tddium run"
alias td_spec="tddium spec"
alias ll="ls -la"
alias unicorn="bundle exec unicorn_rails -c config/unicorn.rb"
alias killit="script/server -p 3001 --debugger"
alias sc="script/console"
alias zendesk="cd ~/.zendesk/workarea/zendesk"
alias tms="cd ~/.zendesk/workarea/zendesk_translation_manager"
alias nginx="nginx -c ~/.zendesk/etc/nginx/nginx.conf -p ."
alias ng="cd ~/.zendesk/etc/nginx"
alias lotus="cd ~/.zendesk/workarea/zendesk_console"
alias hc_classic="cd ~/.zendesk/workarea/help_center/vendor/zendesk"
alias rosetta="cd ~/.zendesk/workarea/rosetta"
alias hc="cd ~/.zendesk/workarea/help_center"
export PATH="$PATH:/opt/local/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$HOME/bin"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GEM_EDITOR='subl'
source ~/.zendesk/profile

function sublg { bundle show $@ | xargs subl; }


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

happy_sad(){
    BOLD="\[\033[1m\]"
    RED="\[\033[1;31m\]"
    GREEN="\[\e[32;1m\]"
		OFF="\[\033[m\]"
		happy_sad=""
    if [ $? = "0" ];then
    	happy_sad="${BOLD}${GREEN}:)${OFF}"
    else
    	happy_sad="${BOLD}${RED}:(${OFF}"
    fi

		echo $happy_sad
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
}

PROMPT_COMMAND='PS1="$(start_of_prompt)$(git_prompt) $(normal_text)$(second_line_prompt)"'

# Initialization for FDK command line tools.Tue Sep 25 12:36:39 2012
FDK_EXE="/Users/acemacu/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/acemacu/bin/FDK/Tools/osx"
export PATH
export FDK_EXE

#[[ -s /Users/acemacu/.nvm/nvm.sh ]] && . /Users/acemacu/.nvm/nvm.sh # This loads NVM

history -a
