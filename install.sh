#!/bin/bash

echo "=========================="
echo "💻 Dotfiles Installer 💾"
echo "=========================="

# Function to install packages with pacman and yay if needed
install_packages() {
  echo "📦 Installing required packages with pacman..."

  sudo pacman -Syu --noconfirm \
    neovim \
    tmux \
    zsh \
    kitty \
    git \
    curl \
    wget \
    ttf-jetbrains-mono \
    zsh-completions \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    nix \
    paleofetch

  # Install p10k and extra plugins manually
  echo "🔌 Installing Zsh plugins and powerlevel10k..."

  ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

  # Install oh-my-zsh if not present
  if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "📥 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $ZSH_CUSTOM/plugins/fast-syntax-highlighting
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
}

# Check if on Arch
if [[ -f /etc/arch-release ]]; then
  echo "🐧 Detected Arch Linux"
  read -p "👉 Do you want to install required packages and plugins? (y/N): " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    install_packages
  else
    echo "⏩ Skipping package installation..."
  fi
else
  echo "❌ This installer is designed for Arch Linux."
  exit 1
fi

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

# Replace kitty config
echo "😺 Replacing kitty config..."
rm -rf ~/.config/kitty
ln -sf ~/dotfiles/kitty ~/.config/kitty

echo "✅ All configs replaced and linked! 🎉"

# Optional: change default shell to zsh
if [[ "$SHELL" != *"zsh" ]]; then
  echo "⚙️ Changing default shell to zsh..."
  chsh -s "$(which zsh)"
  echo "🔁 Please log out and log back in to use zsh."
fi
