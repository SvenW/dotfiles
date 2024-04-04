# Path to your oh-my-zsh configuration.
#ZSH=$HOME/.oh-my-zsh
#
ZSH=$HOME/.zprezto

source $ZSH/init.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="cloud"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git grunt)

#source $ZSH/oh-my-zsh.sh

alias gg="git grep -n"
rgrep() { grep -r -n "$1" . }

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/svenwiden/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/svenwiden/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/svenwiden/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/svenwiden/google-cloud-sdk/completion.zsh.inc'
fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/go/bin:./node_modules/.bin/:/Users/svenwiden/bin:/Users/svenwiden/.asdf/installs/elixir/1.9/.mix/escripts:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GOPATH=$HOME/go
export EDITOR=vim

# The next line enables bash completion for gcloud.
source '/Users/svenwiden/google-cloud-sdk/completion.zsh.inc'

alias kc=kubectl
# kubectl
function c() {
    kubectl config use-context $1
}
function _c() {
    local cur kubectl_out
    cur=${COMP_WORDS[COMP_CWORD]}
    if kubectl_out=$(kubectl config get-contexts -o name 2>/dev/null); then
        COMPREPLY=( $( compgen -W "${kubectl_out[*]}" -- "$cur" ) )
    fi
}
complete -F _c c

eval $(kubectl completion zsh)
#
# Jump
# https://github.com/gsamokovarov/jump#installation
#
eval "$(jump shell zsh)"

eval "$(starship init zsh)"

## Appends every command to the history file once it is executed
#setopt inc_append_history
## Reloads the history whenever you use it
#setopt share_history
#HISTFILE=~/.zsh_history

export GITHUB_ACTOR=$(git config user.name)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# GCLOUD kubectl plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export KUBE_CONFIG_PATH=~/.kube/config
#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###
