
# 🧠 Vim Essentials Cheat Sheet

A quick reference for basic Vim commands — perfect for beginners or daily use!

---

## 🧭 Movement

| Command | Description                        |
|---------|------------------------------------|
| `h`     | Move left                          |
| `j`     | Move down                          |
| `k`     | Move up                            |
| `l`     | Move right                         |
| `w`     | Next word                          |
| `b`     | Back a word                        |
| `0`     | Start of line                      |
| `^`     | First non-blank character of line  |
| `$`     | End of line                        |
| `gg`    | Go to top of file                  |
| `G`     | Go to bottom of file               |
| `:n`    | Go to line `n` (e.g., `:42`)       |

---

## 🧹 Editing

| Command   | Description                                 |
|-----------|---------------------------------------------|
| `i`       | Insert before cursor                        |
| `I`       | Insert at beginning of line                 |
| `a`       | Append after cursor                         |
| `A`       | Append at end of line                       |
| `o`       | Open new line below                         |
| `O`       | Open new line above                         |
| `x`       | Delete character under cursor               |
| `r<char>` | Replace character under cursor with `<char>`|
| `s`       | Delete character and start inserting        |
| `cc`      | Change entire line (same as `S`)            |
| `cw`      | Change to end of word                       |
| `c$`      | Change to end of line                       |
| `C`       | Same as `c$`                                |

---

## ✂️ Delete / Copy / Paste

| Command | Description              |
|---------|--------------------------|
| `dd`    | Delete line              |
| `dw`    | Delete word              |
| `d$`    | Delete to end of line    |
| `d0`    | Delete to start of line  |
| `yy`    | Yank (copy) line         |
| `yw`    | Yank word                |
| `p`     | Paste after cursor       |
| `P`     | Paste before cursor      |

---

## 🔁 Undo / Redo

| Command   | Description      |
|-----------|------------------|
| `u`       | Undo             |
| `<C-r>`   | Redo (Ctrl + r)  |

---

## 🔍 Search

| Command     | Description                          |
|-------------|--------------------------------------|
| `/word`     | Search forward for `word`            |
| `?word`     | Search backward for `word`           |
| `n`         | Repeat search in same direction      |
| `N`         | Repeat search in opposite direction  |
| `*`         | Search for word under cursor         |
| `#`         | Search backward for word under cursor|

---

## 🎯 Visual Mode

| Command   | Description                         |
|-----------|-------------------------------------|
| `v`       | Start visual selection (character)  |
| `V`       | Start linewise visual selection     |
| `<C-v>`   | Start block (column) selection      |
| `d`       | Delete selected                     |
| `y`       | Yank (copy) selected                |
| `>` / `<` | Indent / unindent selection         |

---

## 🚪 File Operations

| Command     | Description               |
|-------------|---------------------------|
| `:w`        | Save (write) file         |
| `:q`        | Quit                      |
| `:wq`       | Save and quit             |
| `:q!`       | Quit without saving       |
| `:e <file>` | Open file                 |
| `:Ex`       | Open file explorer        |

---

✍️ Made for LazyVim/Vim users who want a handy reference!

