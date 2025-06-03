# LazyVim Navigation Guide

This guide covers essential navigation techniques for LazyVim, enabling you to navigate and edit documents like a professional.

## Installation

```bash
# On Linux/macOS
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# On Windows (PowerShell)
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
rm -rf $env:LOCALAPPDATA\nvim\.git
```

## Basic Document Navigation

### Character and Line Movement
- `h`, `j`, `k`, `l` - Left, down, up, right
- `0` - Start of line
- `$` - End of line
- `^` - First non-blank character of line

### Word Movement
- `w` - Jump to start of next word
- `b` - Jump to start of previous word
- `e` - Jump to end of word
- `ge` - Jump to end of previous word

### Screen Movement
- `Ctrl-d` - Move half page down
- `Ctrl-u` - Move half page up
- `Ctrl-f` - Move full page down
- `Ctrl-b` - Move full page back (up)

### File Movement
- `gg` - Go to top of file
- `G` - Go to bottom of file
- `:{number}` - Go to specific line number
- `{number}G` - Go to specific line number

### Block Movement
- `}` - Jump to next paragraph
- `{` - Jump to previous paragraph
- `%` - Jump between matching brackets

### Search and Jump
- `/pattern` - Search forward for pattern
- `?pattern` - Search backward for pattern
- `n` - Next search result
- `N` - Previous search result
- `*` - Search for word under cursor (forward)
- `#` - Search for word under cursor (backward)
- `f{char}` - Jump to next occurrence of character
- `F{char}` - Jump to previous occurrence of character
- `t{char}` - Jump to before next occurrence of character
- `;` - Repeat last f, F, t, or T movement
- `,` - Repeat last f, F, t, or T movement in opposite direction

### Code Navigation
- `gd` - Go to definition
- `gr` - Go to references
- `]c` - Next change (in Git diff)
- `[c` - Previous change
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `]f` - Next function
- `[f` - Previous function

### Mark Navigation
- `m{a-zA-Z}` - Set mark at cursor position
- `` `{a-zA-Z}`` - Jump to mark
- `` `.`` - Jump to position of last change

## Managing Splits

### Creating Splits
- `:split path/to/file` or `:sp path/to/file` - Open file in horizontal split
- `:vsplit path/to/file` or `:vs path/to/file` - Open file in vertical split
- `<leader>-` - Create a horizontal split
- `<leader>|` - Create a vertical split
- `<leader>w-` - Horizontal split
- `<leader>w|` - Vertical split

### Using Telescope with Splits
1. Press `<leader>ff` to open Telescope file finder
2. Navigate to the file you want to open
3. Press `<C-s>` to open in a horizontal split
4. Press `<C-v>` to open in a vertical split

### Using Neo-tree with Splits
1. Press `<leader>e` to open the file explorer
2. Navigate to the file you want to open
3. Press `s` to open in a horizontal split
4. Press `v` to open in a vertical split

### Navigating Between Splits
- `<Ctrl-w>h` - Move to the split on the left
- `<Ctrl-w>j` - Move to the split below
- `<Ctrl-w>k` - Move to the split above
- `<Ctrl-w>l` - Move to the split on the right
- `<leader>ww` - Cycle through windows

### Resizing Splits
- `<C-w>=` - Make all splits equal size
- `<C-w>_` - Maximize height of current split
- `<C-w>|` - Maximize width of current split

### Closing Splits
- `:q` or `<C-w>q` - Close the current split
- `:wq` - Save and close the current split
- `<leader>wd` or `<leader>wc` - Close current window/split
- `<C-w>o` or `:only` - Close all splits except the current one
- `:qa` - Close all splits and quit

## File Navigation

### File Finder
- `<leader>ff` - Find files
- `<leader>fr` - Recent files
- `<leader>fb` - Buffers
- `<leader>sf` - Search in files (grep)
- `<leader>e` - File explorer

### Buffer Navigation
- `<leader>bb` - Switch to other buffer
- `H` - Go to previous buffer
- `L` - Go to next buffer

## Multi-Cursor Editing

### Using vim-visual-multi
Configure in `~/.config/nvim/lua/plugins/multicursor.lua`:

```lua
return {
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    branch = "master",
    init = function()
      -- Use C-d instead of C-n to avoid conflicts
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Select All"] = "<C-a>",
        ["Add Cursor Down"] = "<C-Down>",
        ["Add Cursor Up"] = "<C-Up>",
        ["Add Cursor At Pos"] = "<C-x>",
        ["Visual All"] = "<C-a>"
      }
      vim.g.VM_default_mappings = 0
    end,
  },
}
```

With this configuration:
- `<C-d>` - Select the word under cursor (or next occurrence)
- `<C-Down/Up>` - Create cursors vertically
- `<Shift-Arrows>` - Select in direction
- `n/N` - Get next/previous occurrence
- `[/]` - Select next/previous cursor
- `q` - Skip current and get next occurrence
- `Q` - Remove current cursor/selection
- `<Esc>` - Exit multi-cursor mode

### Alternative Multi-Cursor Techniques

#### Visual Block
- `<C-v>` - Enter visual block mode
- Select the columns you want to edit
- `I` - Insert at the beginning of each line
- `A` - Append at the end of each line
- Type your text, then press `<Esc>` twice

#### Search and Replace
- `:%s/oldtext/newtext/g` - Replace all occurrences
- `:%s/oldtext/newtext/gc` - Replace with confirmation
- `:'<,'>s/oldtext/newtext/g` - Replace in visual selection

#### Macros
- `qq` - Start recording macro in register 'q'
- Make your edits
- `q` - Stop recording
- `@q` - Execute the macro
- `10@q` - Execute the macro 10 times

## Customization

Add custom plugins by creating files in `~/.config/nvim/lua/plugins/`:

Example for enhanced multi-cursor support:
```lua
-- ~/.config/nvim/lua/plugins/multicursor.lua
return {
  {
    "mg979/vim-visual-multi",
    -- configuration as shown above
  }
}
```

Run `:Lazy sync` after adding new plugins or making configuration changes.
