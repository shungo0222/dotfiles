# Dotfiles

Personal dotfiles managed by [chezmoi](https://www.chezmoi.io/).

This repository contains my development environment configuration, designed to be portable across macOS and Linux (Ubuntu/Debian) systems. A single command sets up the entire environment from scratch.

## Quick Start

### New Machine Setup

```bash
# Install chezmoi and apply dotfiles in one command
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply shungo0222
```

This will:
1. Install chezmoi
2. Clone this repository
3. Apply all configuration files
4. Run the bootstrap script to install required tools

### Existing chezmoi Installation

```bash
chezmoi init shungo0222 --apply
```

### Update Configuration

```bash
chezmoi update --apply
```

## What's Included

### Shell Environment

| Component | Description |
|-----------|-------------|
| **Zsh** | Default shell with extensive customization |
| **Oh My Zsh** | Zsh framework for managing configuration |
| **Starship** | Fast, customizable prompt with gruvbox-rainbow preset |
| **fzf** | Fuzzy finder for files, history, and more |

### Oh My Zsh Plugins

**Core / Utility:**
- `git` - Git integration and aliases
- `aliases` - Enhanced alias support
- `you-should-use` - Suggests better shell commands
- `chezmoi` - Dotfile manager integration
- `colored-man-pages` - Colorized man pages

**Developer Experience:**
- `zsh-syntax-highlighting` - Syntax highlighting in terminal
- `zsh-autosuggestions` - Fish-like autosuggestions
- `zsh-bat` - Pretty cat with syntax highlighting
- `fzf` - Fuzzy finder integration

**File & Clipboard:**
- `copyfile` - Copy file contents to clipboard
- `copypath` - Copy file path to clipboard

**Container & Cloud:**
- `docker` - Docker aliases and helpers
- `docker-compose` - Docker Compose support
- `aws` - AWS CLI auto-completion

**Terminal:**
- `ssh` - SSH host completions
- `tmux` - Tmux integration
- `starship` - Starship prompt integration

### Terminal Multiplexer

| Component | Description |
|-----------|-------------|
| **tmux** | Terminal multiplexer for session management |
| **Tmuxifier** | Tmux session/window layout manager |

### Editor

| Component | Description |
|-----------|-------------|
| **Neovim** | Modern Vim-based editor |
| **lazy.nvim** | Plugin manager |

#### Neovim Plugins

- **alpha.lua** - Dashboard/start screen
- **catppuccin.lua** - Color scheme
- **claudecode.lua** - Claude Code AI integration
- **completions.lua** - Auto-completion
- **debugging.lua** - Debug adapter protocol
- **diffview.lua** - Git diff viewer
- **gitgraph.lua** - Git commit graph visualization
- **gitsigns.lua** - Git signs in gutter
- **lazygit.lua** - Lazygit integration
- **lsp-config.lua** - Language Server Protocol
- **lualine.lua** - Status line
- **neo-tree.lua** - File explorer
- **none-ls.lua** - Null-ls for formatters/linters
- **telescope.lua** - Fuzzy finder UI
- **treesitter.lua** - Syntax highlighting
- **vim-tmux-navigator.lua** - Seamless tmux/vim navigation
- **which-key.lua** - Keybinding hints

### CLI Tools

| Tool | Description |
|------|-------------|
| **colorls** | Colorized `ls` with icons (aliased as `lc`) |
| **Claude Code** | AI pair programming CLI |

### Other

| File | Description |
|------|-------------|
| **starship.toml** | Starship prompt configuration |
| **iTerm2 State** | iTerm2 settings export (macOS) |

## File Structure

```
~/.local/share/chezmoi/
├── README.md                          # This file
├── .chezmoiignore                     # Files to ignore
├── run_once_install-packages.sh.tmpl  # Bootstrap script (runs once)
├── dot_zshrc                          # → ~/.zshrc
├── dot_tmux.conf                      # → ~/.tmux.conf
├── dot_config/
│   ├── starship.toml                  # → ~/.config/starship.toml
│   └── nvim/                          # → ~/.config/nvim/
│       ├── init.lua
│       └── lua/
│           ├── vim-options.lua
│           └── plugins/
│               └── *.lua
└── iTerm2 State.itermexport           # iTerm2 settings
```

## Bootstrap Script

The `run_once_install-packages.sh.tmpl` script automatically installs all required tools on first run:

### macOS (via Homebrew)
- git, zsh, fzf, neovim, tmux, ruby, node

### Linux (via apt)
- git, zsh, fzf, neovim, tmux, ruby-full, nodejs, npm, curl, build-essential, locales

### Cross-Platform
- Oh My Zsh + custom plugins
- Starship prompt
- colorls (Ruby gem)
- Tmuxifier
- TPM (Tmux Plugin Manager)
- Claude Code CLI
- Sets Zsh as default shell

## Key Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `lc` | `colorls -lA --sd` | List files with colors and icons |

## Neovim Keybindings (Claude Code)

All Claude Code keybindings are under `<leader>a`:

| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude Code panel |
| `<leader>af` | Focus Claude Code |
| `<leader>ar` | Resume Claude session |
| `<leader>aC` | Continue Claude session |
| `<leader>am` | Select Claude model |
| `<leader>ab` | Add current buffer to context |
| `<leader>as` | Send selection to Claude (visual mode) |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Deny diff |

## Platform Support

| Platform | Status |
|----------|--------|
| macOS (Apple Silicon) | ✅ Fully supported |
| macOS (Intel) | ✅ Fully supported |
| Ubuntu/Debian | ✅ Fully supported |
| Other Linux | ⚠️ May require manual package installation |

## Requirements

- `curl` - For downloading installers
- `git` - For cloning repositories
- Internet connection - For downloading packages

## Customization

### Adding New Configuration

1. Add the file to chezmoi:
   ```bash
   chezmoi add ~/.config/some-tool/config
   ```

2. Edit and commit:
   ```bash
   chezmoi edit ~/.config/some-tool/config
   chezmoi cd
   git add -A && git commit -m "Add some-tool config"
   git push
   ```

### Modifying Bootstrap Script

Edit `run_once_install-packages.sh.tmpl` to add new tools. The script uses chezmoi's `run_once_` prefix, meaning it only runs once per machine. To re-run after changes:

```bash
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

## License

Personal configuration files. Feel free to use as inspiration for your own dotfiles.
