# enable this and zprof on last line for profiling zshrc load time
#zmodload zsh/zprof

unsetopt BEEP
export EDITOR=nvim
export PATH=~/.local/bin:$PATH

# oh-my-zsh
export ZSH=${HOME}/.oh-my-zsh

# Skip untracked files in git prompt (perf optimization for large repos)
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_THEME="agnoster"

plugins=(git shrink-path nvm)

source $ZSH/oh-my-zsh.sh

# Aliases
alias yeet="rm -rf"
alias vimmod='vim $(git ls-files -m)'
alias vim="nvim"
alias vi="nvim"

alias jqs='jq .scripts package.json'
alias jsq='jqs'
alias jqd='jq .dependencies package.json'
alias jds='jqd'

alias lastcommit="git rev-parse HEAD"

alias celar="clear"
alias cler="clear"
alias clera="clear"

alias cat="bat"
alias ls="eza"
alias ll="eza -la"
alias tree="eza --tree"

alias cdr='cd $(git root)'

# Functions
function mcdir {
  command mkdir -p "$1" && cd "$1"
}

# Shorten cwd path using shrink_path fish-like plugin
prompt_dir() {
  prompt_segment blue black "$(shrink_path -f)"
}

autoload -U add-zsh-hook

# Modern tool inits
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# WSL settings (uncomment if needed)
# if uname -r | grep -qi microsoft; then
#   export BROWSER=wslview
# fi

# zprof

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
# Platform-aware PNPM_HOME (pnpm's install dir differs per OS).
# NOTE: don't re-run `pnpm setup` — it would overwrite this block with a flat default.
case "$(uname -s)" in
  Darwin) export PNPM_HOME="$HOME/Library/pnpm" ;;
  *)      export PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm" ;;
esac
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
