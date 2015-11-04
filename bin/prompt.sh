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
