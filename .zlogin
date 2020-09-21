#
# Set up the PATH for me
#
# ...start with the system's path_helper - a great place to start
if [[ -x /usr/libexec/path_helper ]] then
	eval `/usr/libexec/path_helper -s`
fi
# ...now do the RVM stuff - if it exists
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# ...now put in all the components I need
for dir in $HOME/bin $HOME/.rvm/bin /usr/local/bin /usr/local/sbin
do
	if [[ -d $dir ]] then
		if [[ -z $PATH ]] then
			PATH=$dir
		else
			if [[ "`echo $PATH | grep $dir`" != "$PATH" ]] then
				PATH=$dir':'$PATH
			fi
		fi
	fi
done
export PATH=.':'$PATH
#
# Make sure that the ~/Library directory is ALWAYS available to me
#
/usr/bin/chflags nohidden ~/Library
