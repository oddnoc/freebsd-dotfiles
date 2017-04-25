# $FreeBSD: src/share/skel/dot.profile,v 1.21 2002/07/07 00:00:54 mp Exp $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# remove /usr/games if you want
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# TERM=xterm; 	export TERM

BLOCKSIZE=K;	export BLOCKSIZE
EDITOR=vim;   	export EDITOR
PAGER=more;  	export PAGER

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

if [ -x /usr/games/fortune ] ; then /usr/games/fortune freebsd-tips ; fi

# some useful aliases
alias h='fc -l'
alias j=jobs
alias m=$PAGER
alias ll='ls -laGo'
alias l='ls -FG'
alias g='egrep -i'
alias nf='netstat -f inet -p tcp'

alias pkg_branches='pkg query -e "%#d > 0 && %#r > 0" "%o"'
alias pkg_leaves='pkg query -e "%#d > 0 && %#r = 0" "%o"'
alias pkg_origins='(pkg_roots; pkg_leaves)|sort'
alias pkg_roots='pkg query -e "%#d = 0 && %#r = 0" "%o"'
alias pkg_trunks='pkg query -e "%#d = 0 && %#r > 0" "%o"'

# alias cp='cp -ip'
# alias mv='mv -i'
# alias rm='rm -i'

export LSCOLORS="hxfxcxdxbxegedabagacad"
[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
        source /usr/local/share/bash-completion/bash_completion.sh

## Shell prompt based on http://brettterpstra.com/my-new-favorite-bash-prompt/ & http://www.debian-administration.org/articles/548
prompt_command () {
    if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
        ERRPROMPT=" "
    else
        ERRPROMPT=' ERR: $? '
    fi
    if [ "$HOME" == "$PWD" ]
    then
        TRUNCWD="~"
    elif [ "$HOME" ==  "${PWD:0:${#HOME}}" ]
    then
        TRUNCWD="~${PWD:${#HOME}}"
    else
        TRUNCWD="$PWD"
    fi

    local pwdmaxlen=32
    if [ ${#TRUNCWD} -gt $pwdmaxlen ]
    then
        local pwdoffset=$(( ${#TRUNCWD} - $pwdmaxlen  ))
        TRUNCWD="...${TRUNCWD:$pwdoffset:$pwdmaxlen}"
    fi

    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local BLUE="\[\033[0;34m\]"
    local GRAY="\[\033[0;37m\]"
    local DKGRAY="\[\033[1;30m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[0;31m\]"
    # return color to Terminal setting for text color
    local DEFAULT="\[\033[0;39m\]"
    export PS1="${BLUE}\u@\h ${CYAN}\t ${BCYAN}${TRUNCWD}${RED}${ERRPROMPT}${DEFAULT}\\$ "
}
PROMPT_COMMAND=prompt_command

[ -f ~/bin/z.sh ] && . ~/bin/z.sh
