" version14 — colorscheme for Vim 8+
hi clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'version14'

" Resolve variant: g:version14_style > 'background' setting
let s:style = get(g:, 'version14_style', '')
if s:style ==# '' | let s:style = &background ==# 'light' ? 'light' : 'dark' | endif
if s:style !=# 'light' | let s:style = 'dark' | endif
let &background = s:style ==# 'light' ? 'light' : 'dark'

if has('termguicolors') | set termguicolors | endif

" ── Dark palette ─────────────────────────────────────────────────────────────
if s:style ==# 'dark'
  let [s:bg_dark, s:bg, s:bg0, s:bg1, s:bg2, s:bg3, s:bg4] =
    \ ['#08090A', '#14171B', '#0E1012', '#1A1E23', '#23262B', '#2E3238', '#505560']
  let [s:fg, s:fg1, s:fg2, s:fg3] =
    \ ['#F2F4F6', '#9CA0A6', '#6E737A', '#505560']
  let [s:accent, s:accent2, s:blue, s:green, s:yellow, s:red] =
    \ ['#D2FF3A', '#B8E625', '#6FB1FF', '#4ADE80', '#FFB347', '#FF5C5C']
  let [s:selection, s:active_line, s:bracket_bg, s:read_bg, s:write_bg] =
    \ ['#323B20', '#1B1E22', '#262D1E', '#25282C', '#2E3135']
  let [s:diff_add, s:diff_change, s:diff_delete] =
    \ ['#1E3128', '#1D2B3A', '#341F20']
  let [s:git_add, s:git_change, s:git_delete] =
    \ ['#4ADE80', '#6FB1FF', '#FF5C5C']

" ── Light palette ─────────────────────────────────────────────────────────────
else
  let [s:bg_dark, s:bg, s:bg0, s:bg1, s:bg2, s:bg3, s:bg4] =
    \ ['#F7F8F9', '#E8EAED', '#EFF1F3', '#F7F8F9', '#D0D4D9', '#BFC4CA', '#767B82']
  let [s:fg, s:fg1, s:fg2, s:fg3] =
    \ ['#0D0F11', '#555A61', '#636870', '#767B82']
  let [s:accent, s:accent2, s:blue, s:green, s:yellow, s:red] =
    \ ['#4E6600', '#566E0C', '#1B4FCC', '#166534', '#92400E', '#B91C1C']
  let [s:selection, s:active_line, s:bracket_bg, s:read_bg, s:write_bg] =
    \ ['#D0D6C8', '#E2E4E8', '#D3D9CE', '#D4D7DA', '#CBCDD1']
  let [s:diff_add, s:diff_change, s:diff_delete] =
    \ ['#CDD9D5', '#CDD6E9', '#E2CFD2']
  let [s:git_add, s:git_change, s:git_delete] =
    \ ['#166634', '#1B4FCC', '#B91C1C']
endif

" ── Helper ───────────────────────────────────────────────────────────────────
function! s:hi(group, fg, bg, ...) abort
  let l:cmd = 'hi ' . a:group
  if a:fg  !=# '' | let l:cmd .= ' guifg=' . a:fg  | endif
  if a:bg  !=# '' | let l:cmd .= ' guibg=' . a:bg  | endif
  if a:0 >= 1 && a:1 !=# '' | let l:cmd .= ' gui='   . a:1 | endif
  if a:0 >= 2 && a:2 !=# '' | let l:cmd .= ' guisp=' . a:2 | endif
  execute l:cmd
endfunction

" ── Base syntax groups ───────────────────────────────────────────────────────

call s:hi('Normal',         s:fg,     s:bg)
call s:hi('NormalNC',       s:fg,     s:bg1)
call s:hi('NormalFloat',    s:fg,     s:bg0)
call s:hi('FloatBorder',    s:bg3,    s:bg0)
call s:hi('FloatTitle',     s:fg,     s:bg0,  'bold')
call s:hi('FloatFooter',    s:fg1,    s:bg0)

call s:hi('Comment',        s:fg2,    '',     'italic')

call s:hi('Constant',       s:yellow, '')
call s:hi('String',         s:green,  '')
call s:hi('Character',      s:green,  '')
call s:hi('Number',         s:yellow, '')
call s:hi('Boolean',        s:yellow, '',     'italic')
call s:hi('Float',          s:yellow, '')

call s:hi('Identifier',     s:fg,     '')
call s:hi('Function',       s:accent, '')

call s:hi('Statement',      s:accent2,'')
call s:hi('Conditional',    s:accent, '')
call s:hi('Repeat',         s:accent, '')
call s:hi('Label',          s:blue,   '')
call s:hi('Operator',       s:fg1,    '')
call s:hi('Keyword',        s:accent2,'')
call s:hi('Exception',      s:red,    '')

call s:hi('PreProc',        s:yellow, '')
call s:hi('Include',        s:fg1,    '',     'italic')
call s:hi('Define',         s:yellow, '')
call s:hi('Macro',          s:accent2,'')
call s:hi('PreCondit',      s:yellow, '')

call s:hi('Type',           s:blue,   '')
call s:hi('StorageClass',   s:accent2,'')
call s:hi('Structure',      s:blue,   '')
call s:hi('Typedef',        s:blue,   '')

call s:hi('Special',        s:accent2,'')
call s:hi('SpecialChar',    s:accent2,'')
call s:hi('Tag',            s:blue,   '')
call s:hi('Delimiter',      s:fg2,    '')
call s:hi('SpecialComment', s:fg2,    '',     'italic')
call s:hi('Debug',          s:red,    '')

call s:hi('Underlined',     '',       '',     'underline')
call s:hi('Ignore',         s:bg2,    '')
call s:hi('Error',          s:red,    '')
call s:hi('Todo',           s:accent, '',     'bold')

" ── UI groups ────────────────────────────────────────────────────────────────

call s:hi('ColorColumn',    '',           s:bg2)
call s:hi('Conceal',        s:fg3,        '')
call s:hi('Cursor',         s:bg,         s:accent)
call s:hi('CursorIM',       s:bg,         s:accent)
call s:hi('lCursor',        s:bg,         s:accent)
call s:hi('CursorColumn',   '',           s:bg2)
call s:hi('CursorLine',     '',           s:active_line)
call s:hi('CursorLineFold', s:fg2,        '')
call s:hi('CursorLineSign', '',           s:bg)
call s:hi('Directory',      s:blue,       '')
call s:hi('EndOfBuffer',    s:bg2,        '')
call s:hi('ErrorMsg',       s:red,        '')
call s:hi('VertSplit',      s:bg3,        '')
call s:hi('WinSeparator',   s:bg3,        '')
call s:hi('WinBar',         s:fg1,        s:bg)
call s:hi('WinBarNC',       s:fg2,        s:bg1)
call s:hi('Folded',         s:fg2,        s:bg0)
call s:hi('FoldColumn',     s:fg2,        s:bg0)
call s:hi('SignColumn',     s:fg2,        s:bg)
call s:hi('IncSearch',      s:bg,         s:accent)
call s:hi('Substitute',     s:bg,         s:yellow)
call s:hi('Search',         s:bg,         s:accent2)
hi! link CurSearch IncSearch
call s:hi('LineNr',         s:fg3,        '')
call s:hi('LineNrAbove',    s:fg3,        '')
call s:hi('LineNrBelow',    s:fg3,        '')
call s:hi('CursorLineNr',   s:accent,     '',     'bold')
call s:hi('MatchParen',     s:accent,     s:bracket_bg, 'bold')
call s:hi('ModeMsg',        s:fg,         '',     'bold')
call s:hi('MsgArea',        s:fg,         '')
call s:hi('MsgSeparator',   s:bg3,        '')
call s:hi('MoreMsg',        s:green,      '')
call s:hi('NonText',        s:fg3,        '')
call s:hi('Pmenu',          s:fg,         s:bg0)
call s:hi('PmenuSel',       s:bg,         s:accent)
call s:hi('PmenuKind',      s:blue,       s:bg0)
call s:hi('PmenuKindSel',   s:bg,         s:accent)
call s:hi('PmenuExtra',     s:fg1,        s:bg0)
call s:hi('PmenuExtraSel',  s:bg,         s:accent)
call s:hi('PmenuSbar',      '',           s:bg2)
call s:hi('PmenuThumb',     '',           s:bg3)
call s:hi('Question',       s:green,      '')
call s:hi('QuickFixLine',   '',           s:selection)
call s:hi('SpecialKey',     s:fg3,        '')
call s:hi('StatusLine',     s:fg,         s:bg_dark)
call s:hi('StatusLineNC',   s:fg2,        s:bg_dark)
call s:hi('TabLine',        s:fg2,        s:bg_dark)
call s:hi('TabLineFill',    '',           s:bg_dark)
call s:hi('TabLineSel',     s:fg,         s:bg)
call s:hi('Title',          s:fg,         '',     'bold')
call s:hi('Visual',         '',           s:selection)
call s:hi('VisualNOS',      '',           s:selection)
call s:hi('WarningMsg',     s:yellow,     '')
call s:hi('Whitespace',     s:fg3,        '')
call s:hi('WildMenu',       s:bg,         s:accent)

" ── Diff ─────────────────────────────────────────────────────────────────────

call s:hi('DiffAdd',        '',           s:diff_add)
call s:hi('DiffChange',     '',           s:diff_change)
call s:hi('DiffDelete',     s:git_delete, s:diff_delete)
call s:hi('DiffText',       '',           s:diff_change, 'bold')

" ── Spell ────────────────────────────────────────────────────────────────────

call s:hi('SpellBad',       '', '', 'undercurl', s:red)
call s:hi('SpellCap',       '', '', 'undercurl', s:blue)
call s:hi('SpellLocal',     '', '', 'undercurl', s:green)
call s:hi('SpellRare',      '', '', 'undercurl', s:yellow)

" ── Diagnostics ──────────────────────────────────────────────────────────────

call s:hi('DiagnosticError',          s:red,    '')
call s:hi('DiagnosticWarn',           s:yellow, '')
call s:hi('DiagnosticInfo',           s:blue,   '')
call s:hi('DiagnosticHint',           s:fg3,    '')
call s:hi('DiagnosticOk',             s:green,  '')
call s:hi('DiagnosticUnderlineError', '', '', 'undercurl', s:red)
call s:hi('DiagnosticUnderlineWarn',  '', '', 'undercurl', s:yellow)
call s:hi('DiagnosticUnderlineInfo',  '', '', 'undercurl', s:blue)
call s:hi('DiagnosticUnderlineHint',  '', '', 'undercurl', s:fg3)
call s:hi('DiagnosticSignError',      s:red,    '')
call s:hi('DiagnosticSignWarn',       s:yellow, '')
call s:hi('DiagnosticSignInfo',       s:blue,   '')
call s:hi('DiagnosticSignHint',       s:fg3,    '')

" ── ALE ──────────────────────────────────────────────────────────────────────

call s:hi('ALEError',       '', '', 'undercurl', s:red)
call s:hi('ALEWarning',     '', '', 'undercurl', s:yellow)
call s:hi('ALEInfo',        '', '', 'undercurl', s:blue)
call s:hi('ALEErrorSign',   s:red,    '')
call s:hi('ALEWarningSign', s:yellow, '')
call s:hi('ALEInfoSign',    s:blue,   '')

" ── CoC ──────────────────────────────────────────────────────────────────────

call s:hi('CocErrorSign',   s:red,    '')
call s:hi('CocWarningSign', s:yellow, '')
call s:hi('CocInfoSign',    s:blue,   '')
call s:hi('CocHintSign',    s:fg3,    '')
call s:hi('CocErrorHighlight',   '', '', 'undercurl', s:red)
call s:hi('CocWarningHighlight', '', '', 'undercurl', s:yellow)
call s:hi('CocInfoHighlight',    '', '', 'undercurl', s:blue)
call s:hi('CocHintHighlight',    '', '', 'undercurl', s:fg3)

" ── vim-gitgutter ─────────────────────────────────────────────────────────────

call s:hi('GitGutterAdd',          s:git_add,    '')
call s:hi('GitGutterChange',       s:git_change, '')
call s:hi('GitGutterDelete',       s:git_delete, '')
call s:hi('GitGutterChangeDelete', s:git_change, '')

" ── vim-signify ───────────────────────────────────────────────────────────────

call s:hi('SignifySignAdd',    s:git_add,    '')
call s:hi('SignifySignChange', s:git_change, '')
call s:hi('SignifySignDelete', s:git_delete, '')

" ── NERDTree ──────────────────────────────────────────────────────────────────

call s:hi('NERDTreeDir',        s:blue,    '')
call s:hi('NERDTreeDirSlash',   s:fg2,     '')
call s:hi('NERDTreeFile',       s:fg,      '')
call s:hi('NERDTreeExecFile',   s:green,   '')
call s:hi('NERDTreeOpenable',   s:accent,  '')
call s:hi('NERDTreeClosable',   s:accent2, '')
call s:hi('NERDTreeCWD',        s:accent,  '',   'bold')
call s:hi('NERDTreeHelp',       s:fg2,     '')

" ── fzf ───────────────────────────────────────────────────────────────────────

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Search'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine'],
  \ 'hl+':     ['fg', 'Search'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'VertSplit'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Function'],
  \ 'marker':  ['fg', 'Function'],
  \ 'spinner': ['fg', 'Comment'],
  \ 'header':  ['fg', 'Comment'],
  \ }
