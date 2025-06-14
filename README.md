# My Dotfiles

This repository contains my personal configuration files for:

- **LazyVim** (Neovim config)
- **tmux**
- **oh-my-zsh** (Zsh config)
- **Kitty** (terminal emulator)
- Useful Zsh plugins and themes
- Fonts and system setup for Arch Linux

---

## 🎯 Purpose

This dotfiles setup is mainly tailored for a **Laravel development environment** to enhance productivity using Neovim, tmux, Zsh, and a fast terminal emulator with modern aesthetics.

---

## 📦 Included Configs

| Tool       | Location in Repo     | Target Location      |
|------------|----------------------|-----------------------|
| LazyVim    | `nvim/`              | `~/.config/nvim`      |
| tmux       | `tmux/.tmux.conf`    | `~/.tmux.conf`        |
| zsh        | `zsh/.zshrc`         | `~/.zshrc`            |
| kitty      | `kitty/`             | `~/.config/kitty`     |

---

## ⚙️ Installation

Run the install script to set up everything:

```bash
cd ~/dotfiles
./install.sh
```

This will:

- Detect if you're using Arch Linux
- Optionally install all required packages (see below)
- Remove existing configs (Neovim, tmux, Zsh, Kitty)
- Create symlinks from this repo to your home directory
- Install Oh My Zsh if not present
- Clone and configure the following Zsh plugins and theme:
  - `git`
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
  - `nix-shell`
  - `fast-syntax-highlighting`
  - `zsh-autocomplete`
  - `powerlevel10k` theme
- Change the default shell to `zsh`
- Install JetBrains Mono font and `paleofetch`

---

## 🧰 Required Packages

The script installs the following packages (if confirmed):

- **Core**: `neovim`, `tmux`, `zsh`, `kitty`, `git`, `curl`, `wget`
- **Aesthetics & Info**: `paleofetch`, `ttf-jetbrains-mono`
- **Zsh Plugins**: via `git` and `oh-my-zsh` custom plugin directory

> On first run, `p10k` may prompt you to configure it interactively.

---

## 🛠️ Custom tmux Configuration

The tmux config (`tmux/.tmux.conf`) includes the following enhancements:

- ✅ Prefix changed to `Ctrl + Space`
- ✅ `Ctrl + Space + c` opens a new window in the current directory
- ✅ `base-index` and `pane-base-index` set to 1 for intuitive numbering
- ✅ Mouse support enabled
- ✅ Catppuccin theme with rounded window status
- ✅ Status line modules for CPU and battery
- ✅ Integrated [TPM](https://github.com/tmux-plugins/tpm) and `tmux-resurrect` for plugin management and session persistence

To activate plugins:

```bash
# After launching tmux
prefix + I  # Installs plugins
prefix + Ctrl + r  # Reloads last session if using tmux-resurrect
```

---

## 💻 Kitty Terminal

Custom Kitty configuration is included in `kitty/` and linked to `~/.config/kitty`. It supports:

- JetBrains Mono Nerd Font
- Optional Catppuccin Mocha theme
- Transparency and font tweaks

---

## 📸 Terminal Aesthetics

Use `paleofetch` for a minimal system fetch banner (included in the install).

---

## 🔠 Fonts

JetBrains Mono Nerd Font is installed and used for Kitty and Neovim. Set it manually in:

```conf
# ~/.config/kitty/kitty.conf
font_family JetBrainsMono Nerd Font
```

---

## ❓ Troubleshooting

If `p10k` doesn’t render correctly, ensure:

- Your terminal supports powerline fonts
- `JetBrainsMono Nerd Font` is set and installed
- Kitty or terminal emulator uses the correct font settings

---

## 🧪 Tested On

- ✅ Arch Linux (EndeavourOS)
- ✅ KDE Plasma 6 (Kitty + Dolphin)
