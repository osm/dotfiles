export PS1="\h:\w\$ "
export PATH="$PATH:$HOME/bin:$HOME/go/bin:/usr/local/go/bin:$HOME/.cargo/bin:$HOME/.bin"
export EDITOR="vim"
export GPG_TTY=$(tty)
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER "$(history 1)" >> $HOME/.bash_eternal_history'

alias ls="ls -F"
alias vim="vim -p"
alias jq="jq -M"
alias dumpinen="dumpinen | xargs echo $(date "+%Y-%m-%d %H:%M:%S") | tee -a $HOME/.dumpinen"
alias feh="feh -F -d"

function lcd {
	cd $(tail -n 1000 "$HOME/.bash_eternal_history" | grep "cd " | tail -n 1 | cut -d' ' -f9-)
}
