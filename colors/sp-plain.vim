" Name: sp-plain (Safal Piya's Plain)
" Author: Safal Piya (mrsafalpiya)
" URL: https://github.com/mrsafalpiya/sp-plain-vim
" (see this url for latest release & screenshots)
" License: Public domain

" = PREREQUISITES =
hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "sp-plain"

set background=dark

" = HIGHLIGHT FUNCTION =
function SetHi(group, term, cterm, ctermfg, ctermbg, gui, guifg, guibg)
	execute "highlight " . a:group . " term=" . a:term . " cterm=" . a:cterm . " ctermfg=" . a:ctermfg . " ctermbg=" . a:ctermbg . " gui=" . a:gui . " guifg=" . a:guifg . " guibg=" . a:guibg
endfunction

function SwapHiGroup(group)
	let id = synIDtrans(hlID(a:group))
	for mode in ['cterm', 'gui']
		for g in ['fg', 'bg']
			exe 'let '. mode.g. "=  synIDattr(id, '".
				\ g."#', '". mode. "')"
			exe "let ". mode.g. " = empty(". mode.g. ") ? 'NONE' : ". mode.g
		endfor
	endfor
	exe printf('hi %s ctermfg=%s ctermbg=%s guifg=%s guibg=%s', a:group, ctermbg, ctermfg, guibg, guifg)
endfunction

" = COLOR VARIABLES =
let s:gui00   = "#d0d0d0" " Main gray - Normal text fg
let s:cterm00 = 252
let s:gui01   = "#afd7ff" " Sky blue - Comment fg
let s:cterm01 = 153
let s:gui02   = "#585858" " Light gray - LineNr fg
let s:cterm02 = 240
let s:gui03   = "#262626" " Light gray 2 - ColorColumn bg
let s:cterm03 = 235
let s:gui04   = "#6c6c6c" " Light gray 3 - Folded fg
let s:cterm04 = 242
let s:gui05   = "#ff0000" " Red - Match Paren fg
let s:cterm05 = 9
let s:gui06   = "#ffd700" " Gold - Todo fg
let s:cterm06 = 220
let s:gui07   = "#ffffff" " Plain White
let s:cterm07 = 15
let s:gui08   = "#afafd7" " Light Steel Blue - Functions
let s:cterm08 = 146
let s:gui09   = "#afaf87" " Navajo White - Types
let s:cterm09 = 144
let s:gui0A   = "#afaf00" " Gold 2 - Indent blankline
let s:cterm0A = 142

" = DEFINE COLORS =
" Main interface
call SetHi("Normal", "NONE", "NONE", s:cterm00, "NONE", "NONE", s:gui00, "NONE")
call SetHi("ColorColumn", "NONE", "NONE", "NONE", s:cterm03, "NONE", "NONE", s:gui03)
call SetHi("Comment", "NONE", "NONE", s:cterm01, "NONE", "NONE", s:gui01, "NONE")
call SetHi("FoldColumn", "NONE", "NONE", s:cterm04, "NONE", "NONE", s:gui04, "NONE")
call SetHi("Folded", "NONE", "NONE", s:cterm04, "NONE", "NONE", s:gui04, "NONE")
call SetHi("LineNr", "NONE", "NONE", s:cterm02, "NONE", "NONE", s:gui02, "NONE")
call SetHi("NonText", "NONE", "NONE", s:cterm04, "NONE", "NONE", s:gui04, "NONE")
call SetHi("SignColumn", "NONE", "NONE", s:cterm04, "NONE", "NONE", s:gui04, "NONE")
call SetHi("SpecialComment", "NONE", "NONE", s:cterm04, "NONE", "NONE", s:gui04, "NONE")
call SetHi("SpecialKey", "NONE", "NONE", s:cterm04, "NONE", "NONE", s:gui04, "NONE")
call SetHi("StatusLineNC", "NONE", "NONE", "fg", s:cterm04, "NONE", "fg", s:gui04)
call SetHi("VertSplit", "NONE", "NONE", "black", s:cterm04, "NONE", "black", s:gui04)

" Highlighted
call SetHi("CursorColumn", "NONE", "NONE", "NONE", s:cterm03, "NONE", "NONE", s:gui03)
call SetHi("CursorIM", "NONE", "NONE", "black", "4", "NONE", "black", "#00FFFF")
call SetHi("CursorLineNr", "NONE", "NONE", "NONE", "black", "NONE", "NONE", "black")
call SetHi("CursorLine", "NONE", "NONE", "NONE", s:cterm03, "NONE", "NONE", s:gui03)
call SetHi("Cursor", "NONE", "NONE", "black", "4", "NONE", "black", "#00FFFF")
call SetHi("Directory", "NONE", "NONE", "69", "NONE", "NONE", "#5F87FF", "NONE")
call SetHi("ErrorMsg", "NONE", "NONE", "fg", "52", "NONE", "fg", "#5F0000")
call SetHi("Error", "NONE", "NONE", "fg", "52", "NONE", "fg", "#5F0000")
call SetHi("IncSearch", "NONE", "NONE", "black", "green", "NONE", "black", "green")
call SetHi("MatchParen", "bold", "NONE", s:cterm05, "NONE", "bold", s:gui05, "NONE")
call SetHi("ModeMsg", "NONE", "NONE", "69", "NONE", "NONE", "#5F87FF", "NONE")
call SetHi("MoreMsg", "NONE", "NONE", "69", "NONE", "NONE", "#5F87FF", "NONE")
call SetHi("Question", "NONE", "NONE", "69", "NONE", "NONE", "#5F87FF", "NONE")
call SetHi("Search", "NONE", "NONE", "black", "6", "NONE", "black", "#00CDCD")
call SetHi("StatusLine", "NONE", "NONE", "black", "fg", "NONE", "black", "fg")
call SetHi("Todo", "NONE", "bold", s:cterm06, "NONE", "bold", s:gui06, "NONE")
call SetHi("WarningMsg", "NONE", "NONE", "fg", "52", "NONE", "fg", "#5F0000")
call SetHi("WildMenu", "NONE", "NONE", "fg", "black", "NONE", "fg", "black")

" Pmenu
call SetHi("Pmenu", "NONE", "NONE", s:cterm00, s:cterm02, "NONE", s:gui00, s:gui02)
call SetHi("PmenuSel", "NONE", "NONE", s:cterm00, s:cterm02, "NONE", s:gui00, s:gui02)
call SwapHiGroup("PmenuSel")
call SetHi("PmenuSbar", "NONE", "NONE", s:cterm00, s:cterm02, "NONE", s:gui00, s:gui02)
call SetHi("PmenuThumb", "NONE", "NONE", s:cterm00, s:cterm02, "NONE", s:gui00, s:gui02)
call SwapHiGroup("PmenuThumb")

" Reversed
hi Visual term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE gui=reverse guifg=NONE guibg=NONE
hi VisualNOS term=reverse,underline cterm=reverse,underline ctermfg=NONE ctermbg=NONE gui=reverse,underline guifg=NONE guibg=NONE

" TabLine
call SetHi("TabLine", "NONE", "NONE", s:cterm04, "NONE", "NONE", s:gui04, "NONE")
call SetHi("TabLineSel", "NONE", "NONE", s:cterm07, "NONE", "NONE", s:gui07, "NONE")
call SetHi("TabLineFill", "NONE", "NONE", "NONE", "NONE", "NONE", "NONE", "NONE")

" Diff
hi DiffAdd term=NONE cterm=NONE ctermfg=2 ctermbg=NONE gui=NONE guifg=#008000 guibg=NONE
hi DiffChange term=NONE cterm=NONE ctermfg=3 ctermbg=NONE gui=NONE guifg=#808000 guibg=NONE
hi DiffDelete term=NONE cterm=NONE ctermfg=1 ctermbg=NONE gui=NONE guifg=#800000 guibg=NONE
hi DiffText term=NONE cterm=NONE ctermfg=4 ctermbg=NONE gui=NONE guifg=#000080 guibg=NONE

" Spell
hi SpellBad term=underline cterm=underline ctermfg=13 ctermbg=NONE gui=underline guifg=#FF00FF guibg=NONE
hi SpellCap term=underline cterm=underline ctermfg=13 ctermbg=NONE gui=underline guifg=#FF00FF guibg=NONE
hi SpellLocal term=underline cterm=underline ctermfg=13 ctermbg=NONE gui=underline guifg=#FF00FF guibg=NONE
hi SpellRare term=underline cterm=underline ctermfg=13 ctermbg=NONE gui=underline guifg=#FF00FF guibg=NONE

" Vim Features
hi Menu term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Scrollbar term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Tooltip term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

" Syntax Highlighting (or lack of)
hi Boolean term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Character term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Conceal term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Conditional term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Constant term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Debug term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Define term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Delimiter term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Directive term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Exception term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Float term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Format term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
call SetHi("Function", "NONE", "NONE", "NONE", "NONE", "NONE", "NONE", "NONE")
hi Identifier term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Ignore term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Include term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Keyword term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Label term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Macro term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Number term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Operator term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi PreCondit term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi PreProc term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Repeat term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
call SetHi("SpecialChar", "NONE", "NONE", s:cterm04, "NONE", "NONE", s:gui04, "NONE")
hi Special term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Statement term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi StorageClass term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi String term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Structure term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Tag term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Title term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
call SetHi("Type", "NONE", "NONE", "NONE", "NONE", "NONE", "NONE", "NONE")
call SetHi("Typedef", "NONE", "NONE", "NONE", "NONE", "NONE", "NONE", "NONE")
hi Underlined term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

" Sneak
hi SneakLabelMask term=NONE cterm=NONE ctermfg=black ctermbg=195 gui=NONE guifg=black guibg=#d7ffff
hi SneakTarget term=NONE cterm=NONE ctermfg=black ctermbg=195 gui=NONE guifg=black guibg=#d7ffff
hi SneakLabelTarget term=NONE cterm=NONE ctermfg=black ctermbg=183 gui=NONE guifg=black guibg=#d7afff
hi SneakScope term=NONE cterm=NONE ctermfg=black ctermbg=183 gui=NONE guifg=black guibg=#d7afff

" Indent blankline
call SetHi("IndentBlanklineContextChar", "nocombine", "nocombine", s:cterm0A, "NONE", "nocombine", s:gui0A, "NONE")
call SetHi("IndentBlanklineContextStart", "nocombine,underline", "nocombine,underline", "NONE", "NONE", "nocombine,underline", "NONE", "NONE guisp=" . s:gui0A)
