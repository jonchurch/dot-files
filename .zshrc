# enable this and zprof on last line for profiling zshrc load time
#zmodload zsh/zprof

export EDITOR=vim

# Add awsebcli to path
 export PATH=~/.local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH=${HOME}/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
    ZSH_THEME="agnoster"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z shrink-path)

source $ZSH/oh-my-zsh.sh

# User configuration

## NOTE I don't remember why I added this? will have to check commit history
# tell npm where global packages live
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"


## NOTE This was my original setup for sourcing NVM, before I experimented with deferred loading...
	# I've also learned that nvm maintainers do not recommend installing w/ brew, so maybe I should step back and reevaluate
		# Ideally, these snippets will be compatible w/ Mac and Linux as much as possible, which the use of brew breaks anyways
# setup nvm
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
export NVM_DIR="$(grealpath $HOME/.nvm)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


## NOTE This is my new way of sourcing nvm, but I've noticed that on startup it's using latest node not the default alias
#	That is, until I run an nvm command and trigger the lazy-loading of nvm, which suddenly switches back to default
	#	That does not seem good...
# export NVM_DIR="$HOME/.nvm"
# # [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
# export PATH="$NVM_DIR/versions/node/v$(<$NVM_DIR/alias/default)/bin:$PATH"
# alias nvm="unalias nvm; [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"; nvm $@"



# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
# export MANPATH="$NPM_PACKAGES/share/man:$(manpath)")
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias yeet="rm -rf"

function search_man { 
  LESS=+/^[[:blank:]]+"$2" man "$1" ;
}

function mcdir
{
  command mkdir $1 && cd $1
}

function mcdirp 
{
  command mkdir -p $1 && cd $1
}
alias srvnao="python -m SimpleHTTPServer 8000"

alias lastcommit="git rev-parse HEAD"

# update all outdated deps to latest semver major version
alias npmyeet="npm outdated -p | cut -d ':' -f 4 | xargs npm i"

# Force tmux to support utf8 (fixes unicode in zsh shell prompt for agnoster)
alias tmux="tmux -u"

# Typos
alias celar="clear"
alias cler="clear"
alias clera="clear"

# bat is improved cat
alias cat="bat"

# Start tmux session
alias start="sh ~/dev-tmux"

## Hooks
autoload -U add-zsh-hook


# Shorten cwd path using shrink_path fish-like plugin
prompt_dir() {
	prompt_segment blue black "$(shrink_path -f)"
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jon/.nvm/versions/node/v12.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jon/.nvm/versions/node/v12.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jon/.nvm/versions/node/v12.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jon/.nvm/versions/node/v12.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/jon/.nvm/versions/node/v12.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/jon/.nvm/versions/node/v12.5.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# zprof

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/qt/bin:$PATH"

# Add pipenv to path
export PYTHON_BIN_PATH="$(python -m site --user-base)/bin"
export "PATH=$PATH:$PYTHON_BIN_PATH"

# Go paths
export GOPATH="$HOME/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
