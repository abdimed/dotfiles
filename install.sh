#!/bin/bash

echo "=========================="
echo "💻 Dotfiles Installer 💾"
echo "=========================="

# Replace LazyVim config
echo "📁 Replacing LazyVim config..."
rm -rf ~/.config/nvim
ln -sf ~/dotfiles/nvim ~/.config/nvim

# Replace tmux config
echo "🔧 Replacing tmux config..."
rm -f ~/.tmux.conf
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Replace zsh config
echo "💬 Replacing zsh config..."
rm -f ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

echo "✅ All configs replaced and linked! 🎉"
