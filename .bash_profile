export PS1="\H:\w\$ "
export PATH="$PATH:$HOME/bin"
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER "$(history 1)" >> ~/Documents/.bash_eternal_history'

alias ls="ls -F"
alias docker_build_unittest="docker build --build-arg NPM_CACERT='' --build-arg NPM_PROXY='' --build-arg NPM_TOKEN=$(cat ~/.npmrc | cut -d= -f2) -f unit-tests.Dockerfile ."
alias docker_build="docker build --build-arg NPM_CACERT='' --build-arg NPM_PROXY='' --build-arg NPM_TOKEN=$(cat ~/.npmrc | cut -d= -f2) ."
alias tf_plan="./terraform.sh plan -lock-timeout=5m -out terraform.plan"
alias tf_apply="./terraform.sh apply terraform.plan"

function lcd {
	cd $(tail -n 1000 "$HOME/Documents/.bash_eternal_history" | grep "cd " | tail -n 1 | cut -d' ' -f9-)
}
