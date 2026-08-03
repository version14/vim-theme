# version14

A colorscheme for Vim 8+, ported from the [version14 Zed theme](https://github.com/version14/zed-theme). Dark and Light variants built around a violet accent (`#B7A2FF` dark, `#5F3BBB` light).

> **Note:** the violet accent is currently a **placeholder**, standing in for a retired lime-green accent while a permanent replacement is chosen. It will change again in a future release.
>
> This repo covers plain Vim 8+ only. Neovim users should use [`version14/nvim-theme`](https://github.com/version14/nvim-theme) instead — it's a separate, Lua-based implementation with fuller plugin support.
>
> There's no Black (pure-black/OLED) variant here — only Dark and Light. `g:version14_style` only recognizes `'light'`; anything else falls back to `'dark'`.

## Requirements

- Vim 8.0+
- A terminal with true color support (`termguicolors`)

## Installation

### vim-plug

```vim
Plug 'version14/vim-theme', { 'as': 'version14' }
```

Then run `:PlugInstall`. **This step is required** — adding the `Plug` line alone does not download the plugin; until you install it, Vim will error with `E185: Cannot find color scheme 'version14'` when your `.vimrc` tries to apply it.

### Manual

```sh
git clone https://github.com/version14/vim-theme ~/.vim/pack/plugins/start/version14
```

No separate install step needed — Vim's native package loader (`:help packages`) picks up anything under `pack/*/start/` automatically. Requires Vim 8+; if you're on an older Vim, copy `colors/version14.vim` directly to `~/.vim/colors/version14.vim` instead.

## Verifying the install

After installing, open Vim and run:

```vim
:colorscheme version14
:echo synIDattr(hlID('Function'),'fg#')
```

This should print `#B7A2FF` (or `#5F3BBB` in Light) — the current violet accent. An `E185: Cannot find color scheme` error means the plugin never actually downloaded (run `:PlugInstall` again, or check `:scriptnames` for `version14.vim`); the old lime hex (`#D2FF3A`) means your plugin manager has a stale/pinned commit (run `:PlugUpdate`).

## Usage

```vim
" Dark variant (default)
colorscheme version14

" Light variant (set before colorscheme)
let g:version14_style = 'light'
colorscheme version14
```

## Plugin support

| Plugin | Notes |
|--------|-------|
| vim-gitgutter | Full |
| vim-signify | Full |
| ALE | Error/warning/info signs and underlines |
| CoC | Error/warning/info/hint signs and underlines |
| NERDTree | Full |
| fzf | Color palette via `g:fzf_colors` |

## Palette

| Role | Dark | Light |
|------|------|-------|
| Background | `#14171B` | `#EBEDEF` |
| Accent (placeholder) | `#B7A2FF` | `#5F3BBB` |
| Blue | `#78AFFF` | `#0054CB` |
| Green | `#4BDE7F` | `#166534` |
| Yellow | `#FFA85E` | `#8F4400` |
| Red | `#FF5C59` | `#B91A25` |

## Also available for Zed, Neovim, VS Code, Ghostty, Starship, gh-dash, and Atuin

- [Zed extension](https://github.com/version14/zed-theme)
- [Neovim plugin](https://github.com/version14/nvim-theme)
- [VS Code extension](https://github.com/version14/vscode-theme)
- [Ghostty theme](https://github.com/version14/ghostty-theme)
- [Starship palette](https://github.com/version14/starship-theme)
- [gh-dash theme](https://github.com/version14/gh-dash-theme)
- [Atuin theme](https://github.com/version14/atuin-theme)

## License

[MIT](./LICENSE) © [Mathieu Souflis](https://mathieusouflis.fr)
