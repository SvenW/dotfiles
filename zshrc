# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

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

source $ZSH/oh-my-zsh.sh

alias gg="git grep -n"
rgrep() { grep -r -n "$1" . }
alias gt="go test -v"
gtr() { go test -v -run=$1 }

jgtr() {
  TEST_REGEX=$1
  shift # shift all arguments so that $2 => $1 etc.
  TEST_FLAGS="$@" # Let TEST_FLAGS be rest of args

  TEST_FILE=$(fgrep -slr "$TEST_REGEX(" {auth,radio,payment}-lib/test geocoding | head -1)
  if [[ -n $TEST_FILE ]]; then
    go test -v "./$(dirname $TEST_FILE)/..." -test.run="$TEST_REGEX$" $TEST_FLAGS
  else
    echo "Did not find: $TEST_REGEX"
  fi
}

# Customize to your needs...
export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/Users/sven/Downloads/go_appengine/:$HOME/go/bin

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GOPATH=$HOME/go

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/sven/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/Users/sven/google-cloud-sdk/completion.zsh.inc'

# Bash completion for syb cli
source '/Users/sven/projects/soundtrackyourbrand/syb/syb_zsh_completion'

# Docker stuff
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/sven/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
