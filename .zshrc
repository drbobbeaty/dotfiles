#!/bin/zsh
#
# I prefer the editor vim, when I can get it
#
export EDITOR="vim"
#
# This is the development 'home' for me
#
export DEV_HOME="$HOME/Development"
#
# This is so that GPG knows where the TTY input is... I think. :)
#
export GPG_TTY=`tty`
#
# These are where postgres is located for Codebase
#
export PGHOST=localhost
export PGPORT=5432
export PGUSER=postgres

#
# These are my standard aliases that I use all the time
#
alias h='history'
alias cls='clear'
alias ls='ls -F'
alias lt='grc tail -f'
alias xc='export TERM=xterm-color; export CLICOLOR=1; export LSCOLORS=GxFxCxDxBxegedabagacad'
alias dt='export TERM=dtterm'
alias g='mvim'
alias bbe='bbedit --new-window'
alias sub='subl --new-window'
alias s='subl --new-window .'
alias cwdcmd='winname "`echo $PWD | sed -e s,$HOME,~,`"'
alias bbdc='ssh bobbeaty@bobbeaty.com'
alias cu='cvs -q update'
alias tcu='setenv COPYFILE_DISABLE true; tar zcvf \!* `cvs -q update | grep -v \^\? | sed -e "s/^[AM] //g"`; unsetenv COPYFILE_DISABLE'

# usefule aliases for git - I love git!
alias ga='git add'
alias gad='git add .'
alias gb='git branch'
alias gci='git ci'
alias gco='git co'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplrp='git pull --rebase && git push'
alias gst='git st'
alias gsh='git show head'
alias gt='git tag -a'
alias gpt='git push --tags'
alias gdt='git show -s --format=%ci'

alias ldd='otool -L'
alias ectags='ectags  --excmd=number --tag-relative=no  --fields=+a+m+n+S -R'
alias lsrebuild='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user'

alias lcdt='lein do clean, deps, test'
alias lcdr='lein do clean, deps, repl'
alias lcdw='lein do clean, deps, run web'

#
# These are things for the terminal prompt
#
export HISTCONTROL=ignoredups
if [[ -z "$PS1" ]] then
	return
fi
# Make sure we have DISPLAY defined for X11
#
if [[ -z $DISPLAY ]] then
	export DISPLAY=":0.0"
fi
#
# Most times, we want the color - so check the term
#
if [[ ! -z $TERM ]] then
	if [[ "$TERM" == "xterm" ]] then
		export TERM="xterm-color"
	fi
	if [[ "$TERM" == "xterm-color" || "$TERM" == "xterm-256color" ]] then
		export CLICOLOR=1
		export LSCOLORS="GxFxCxDxBxegedabagacad"
	fi
	export PROMPT_COMMAND='cwdcmd'
	export PS1="%m{%n}%!: "
	precmd() { eval "$PROMPT_COMMAND" }
	# this is to make sure we can sign things for Leiningen
	export GPG_TTY=$(tty)
fi
#
# These are simple functions that can't be expressed as aliases, but
# are very simple, and can go here because they are simple.
#
function winname() {
	echo -ne "]0;$1"
}

function tabname() {
	echo -ne "]1;$1"
}

function fixwt() {
	unset PROMPT_COMMAND
	if [ "$1" != "" ]; then
		winname "$1"
	fi
}

#
# Simple function to bounce the networking on this mac. This is useful
# when Cisco AnyConnect 4.1 is used and with High Sierra, it doesn't like
# to connect a second time without the networking being bounced.
#
function bounceen() {
	echo "taking networking down..."
	sudo ifconfig en0 down		# WiFi
	sudo ifconfig en6 down		# Display Adapter
	sleep 5
	echo "bringing up networking..."
	sudo ifconfig en6 up		# Display Adapter
	sudo ifconfig en0 up		# WiFi
}

#
# Function to list the running Clojure JVM jobs based on what they look
# like in the process stack. This is just a simple way to see what I have
# running on this box.
#
function jj() {
	ps -ef | grep java | grep -v grep | grep 'leiningen.core.main' | \
		sed -e 's/^.*-Dleiningen.original.pwd=//g' \
			-e 's/-D.*leiningen.core.main//g' \
			-e "s:$HOME:~:g"
}
