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
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias ssha='eval $(ssh-agent) && ssh-add'
alias tn='tmux new -s'
alias watch='watch -d'
alias reload='source ~/.zshrc && echo reloaded ~/.zshrc'
alias storage='df -H'
alias weather='curl -L wttr.in'

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

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'


alias fish='asciiquarium'

## cd into github workspace for work or personal
workspace() {
    profile=$(gh profile show)

    case "$1" in
    personal | me | self)
        if [ "$profile" != "GonzalezAndrew" ]; then
            gh profile switch GonzalezAndrew
        fi
        cd "$HOME"/github.com/GonzalezAndrew || {
            echo "Failed to cd to personal workspace"
        }
        ;;
    work)
        if [ "$profile" != "Andy-Gonzalez" ]; then
            gh profile switch Andy-Gonzalez
        fi
        cd "$HOME"/github.com/Andy-Gonzalez || {
            echo "Failed to cd to work workspace"
        }
        ;;
    *)
        echo "Usage: workspace [personal | work]"
        ;;
    esac
}

## merge all pre-commit.ci pull requests
pre-ci-auto() {
    prs=$(GH_PAGER="" gh search prs \
        --state open \
        --owner GonzalezAndrew \
        --json author,repository,number \
        --jq 'map(select(.author.login|contains("pre-commit-ci[bot]")))')

    for row in $(echo "$prs" | jq -r '.[] | @base64'); do
        _jq() {
            echo "${row}" | base64 --decode | jq -r "${1}"
        }
        pr_number=$(_jq '.number')
        repo=$(_jq '.repository.nameWithOwner')
        gh pr merge "$pr_number" -R "$repo" --auto -d -m
    done
}
