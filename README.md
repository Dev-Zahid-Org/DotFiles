# 🍿 Dev-Zahid-Org's Dotfiles

This is my personal dotfiles setup, managed with [GNU Stow](https://www.gnu.org/software/stow/). Built to stay clean, minimal, and modular across systems.

> ⚠️ Not a hacker — just a curious guy who loves tweaking his system.

---

## 📁 Structure

```
.
├── bash       # .bashrc and related configs
├── btop       # btop system monitor settings
├── git        # git config with useful aliases and shortcuts
├── neofetch   # neofetch config (with themes from Chick2D)
├── nvim       # Neovim config (using LazyVim)
├── tmux       # tmux configuration and plugins
└── zsh        # .zshrc and plugin configs
```

---

## 🎨 Credit

- **Neofetch themes** inside `neofetch` are from:
  [Chick2D/neofetch-themes](https://github.com/Chick2D/neofetch-themes)
  I'm just using them — full credit goes to Chick2D.

---

## 🚀 Usage

Clone this repo:

```bash
git clone git@github.com:Dev-Zahid-Org/DotFiles.git ~/.dotfiles
cd ~/.dotfiles
```

Use `stow` to set things up:

```bash
stow bash
stow zsh
stow nvim
# stow other configs as needed
```

Make sure to remove existing conflicting files (like `~/.bashrc`) before stowing to avoid errors.

---

## 📌 Notes

- Uses **LazyVim** as the base for Neovim.
- You can symlink each config individually using `stow`.
- Clean and modular for easy migration or rebuilding.

---

Made with love, coffee, and keyboard rage. ☕️⌨️
