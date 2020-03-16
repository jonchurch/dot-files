# Path to your oh-my-zsh installation.
 export ZSH=${HOME}/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
    ZSH_THEME="agnoster"

plugins=(zsh-nvm git z shrink-path)

source $ZSH/oh-my-zsh.sh

# User configuration

## NOTE I don't remember why I added this? will have to check commit history
# tell npm where global packages live
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias yeet="rm -rf"

function mcdir
{
  command mkdir $1 && cd $1
}

# Force tmux to support utf8 (fixes unicode in zsh shell prompt for agnoster)
alias tmux="tmux -u"

# Typos
alias celar="clear"
alias cler="clear"
alias clera="clear"

## Hooks
autoload -U add-zsh-hook

# Shorten cwd path using shrink_path fish-like plugin
prompt_dir() {
	prompt_segment blue black "$(shrink_path -f)"
}
