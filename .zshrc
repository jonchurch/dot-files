# enable this and zprof on last line for profiling zshrc load time
#zmodload zsh/zprof


# Disable beep?
unsetopt BEEP
export EDITOR=nvim

# Add awsebcli to path
 export PATH=~/.local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH=${HOME}/.oh-my-zsh

# Disable only the untracked file status check for prompt
# Alternative to totally turning off the status indicator,
# or setting a 
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
    ZSH_THEME="agnoster"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-z shrink-path nvm)

# zsh-z native zsh port of z # git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias yeet="rm -rf"

alias vimmod='vim $(git ls-files -m)'

# it is time, switch to nvim fulltime
alias vim="nvim"
alias vi="nvim"


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

# cd to git root
alias cdr='cd $(git root)'

# cd to powerva-microsoft dir
alias cdp='~/Work/power-platform-ux/apps/powerva-microsoft-com'

## Hooks
autoload -U add-zsh-hook


# Shorten cwd path using shrink_path fish-like plugin
prompt_dir() {
	prompt_segment blue black "$(shrink_path -f)"
}

# WSL settings
if [[ $(grep -i Microsoft /proc/version) ]]; then
  # set default browser for opening pages from wsl to wslview
  export BROWSER=wslview
  # hacky solution to release memory from the vmmem windows process
  # actually, no clue if this even really works 
  alias drop_cache="sudo sh -c \"echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'\""
fi

# zprof


