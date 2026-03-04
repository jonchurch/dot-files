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
  brew install neovim tree-sitter-cli
elif command -v npm >/dev/null; then
  echo "Installing tree-sitter-cli via npm..."
  npm install -g tree-sitter-cli
  echo "Note: install neovim (0.11+) manually"
fi

link "$DOTFILES/nvim"          "$HOME/.config/nvim"
link "$DOTFILES/.zshrc" "$HOME/.zshrc"

echo "Done!"
