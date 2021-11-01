# Command aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias back='cd $OLDPWD'
alias c='clear'
alias df='df -h -x squashfs -x tmpfs -x devtmpfs'
alias e="vim -O "
alias E="vim -o "
alias extip='curl icanhazip.com'
alias grep='grep --color=auto'
alias lsmount='mount |column -t'
alias ports='netstat -tulanp'
alias h='history -i 1'
alias history='history 1'
alias j='jobs -l'
alias ssha='eval $(ssh-agent) && ssh-add'
alias svim='sudo vim'
alias tn='tmux new -s'
alias watch='watch -d'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi

## get top process eating memory
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias mem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias cpu5='ps auxf | sort -nr -k 3 | head -5'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'

## list largest directories (aka "ducks")
alias dir5='du -cksh * | sort -hr | head -n 5'
alias dir10='du -cksh * | sort -hr | head -n 10'

ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$(echo $* | cut -d @ -f 2)"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}
