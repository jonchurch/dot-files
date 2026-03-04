#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "Backing up $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "Linked $dst -> $src"
}

# Dependencies
if command -v brew >/dev/null; then
  echo "Installing dependencies via brew..."
  brew install neovim tree-sitter-cli eza zoxide fzf bat ripgrep jq
elif command -v cargo >/dev/null; then
  echo "Installing dependencies via cargo..."
  cargo install tree-sitter-cli eza zoxide bat ripgrep
  echo "Note: install neovim (0.11+) and fzf manually"
  echo "  fzf: git clone https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"
else
  echo "Note: install these manually: neovim (0.11+), tree-sitter-cli, eza, zoxide, fzf, bat"
fi

link "$DOTFILES/nvim"               "$HOME/.config/nvim"
link "$DOTFILES/.zshrc"              "$HOME/.zshrc"
link "$DOTFILES/.gitignore_global"   "$HOME/.gitignore_global"

echo "Done!"
