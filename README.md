# My Dotfiles

This repository contains my personal configuration files for:

- **LazyVim** (Neovim config)
- **tmux**
- **oh-my-zsh** (Zsh config)

---

## 🎯 Purpose

This dotfiles setup is mainly tailored for a **Laravel development environment** to enhance productivity with Neovim, tmux, and Zsh.

---

## 📦 Included configs

| Tool    | Location in repo  | Target location  |
| ------- | ----------------- | ---------------- |
| LazyVim | `nvim/`           | `~/.config/nvim` |
| tmux    | `tmux/.tmux.conf` | `~/.tmux.conf`   |
| zsh     | `zsh/.zshrc`      | `~/.zshrc`       |

---

## ⚙️ Installation

Run the install script to set up all configs:

```bash
cd ~/dotfiles
./install.sh
```

This will:

- Remove existing configs if any
- Create symlinks from this repo to your home directory

---

## 🛠️ Custom tmux configuration

The tmux config (`tmux/.tmux.conf`) includes some customizations for better workflow, such as:

- Changed prefix key to `Ctrl + Space`
- Bind `Ctrl + Space + c` to open a new window in the current directory
- Set base-index and pane-base-index to 1 (easier window/pane numbering)
- Enabled mouse support
- Configured Catppuccin theme with rounded window status style
- Added modules for CPU and battery status in the status line
- Integrated TPM (Tmux Plugin Manager) and tmux-resurrect plugin for session persistence
