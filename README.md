# version14

A colorscheme for Vim 8+, ported from the [version14 Zed theme](https://github.com/version14/zed-theme). Dark and Light variants built around a violet accent (`#B7A2FF` dark, `#5F3BBB` light).

> The violet accent is a placeholder, standing in for a retired lime green accent while a permanent replacement is chosen. It will change again in a future release.
>
> This repo covers plain Vim 8+ only. Neovim users should use [`version14/nvim-theme`](https://github.com/version14/nvim-theme) instead, a separate Lua based implementation with fuller plugin support.
>
> There is no Black (pure black/OLED) variant here, only Dark and Light. `g:version14_style` only recognizes `'light'`; anything else falls back to `'dark'`.

## Requirements

- Vim 8.0+
- A terminal with true color support (`termguicolors`)

## Installation

### vim-plug

```vim
Plug 'version14/vim-theme', { 'as': 'version14' }
```

Run `:PlugInstall` afterward. Until you do, `.vimrc` will error with `E185: Cannot find color scheme 'version14'` when it tries to apply the theme.

### Manual

```sh
git clone https://github.com/version14/vim-theme ~/.vim/pack/plugins/start/version14
```

Vim's native package loader (`:help packages`) picks up anything under `pack/*/start/` automatically, so no separate install step is needed. On Vim versions older than 8, copy `colors/version14.vim` directly to `~/.vim/colors/version14.vim` instead.

## Verify

```vim
:colorscheme version14
:echo synIDattr(hlID('Function'),'fg#')
```

This should print `#B7A2FF` (or `#5F3BBB` in Light), the current violet accent. An `E185: Cannot find color scheme` error means the plugin never downloaded: run `:PlugInstall` again, or check `:scriptnames` for `version14.vim`. The old lime hex (`#D2FF3A`) means your plugin manager has a stale or pinned commit: run `:PlugUpdate`.

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

## Also available for

- [Zed](https://github.com/version14/zed-theme)
- [Neovim](https://github.com/version14/nvim-theme)
- [VS Code](https://github.com/version14/vscode-theme)
- [Ghostty](https://github.com/version14/ghostty-theme)
- [Starship](https://github.com/version14/starship-theme)
- [gh-dash](https://github.com/version14/gh-dash-theme)
- [Atuin](https://github.com/version14/atuin-theme)

## License

[MIT](./LICENSE) © [Mathieu Souflis](https://mathieusouflis.fr)
