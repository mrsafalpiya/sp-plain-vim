" Name: sp-plain (Safal Piya's Plain)
" Author: Safal Piya (mrsafalpiya)
" URL: https://github.com/mrsafalpiya/sp-plain-vim
" (see this url for latest release & screenshots)
" License: Public domain

set background=dark

highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="sp-plain"

" Highlight function
" ------------------

function SetHi(group, term, cterm, ctermfg, ctermbg, gui, guifg, guibg)
	execute "highlight! " . a:group . " term=" . a:term . " cterm=" . a:cterm . " ctermfg=" . a:ctermfg . " ctermbg=" . a:ctermbg . " gui=" . a:gui . " guifg=" . a:guifg . " guibg=" . a:guibg
endfunction

" Color Variables
" ---------------

let s:gui_base        = "#bcbcbc" " Grey74
let s:cterm_base      = 250

let s:gui_primary     = "#afd7ff" " LightSkyBlue1
let s:cterm_primary   = 153

let s:gui_secondary   = "#8787af" " LightSlateGrey
let s:cterm_secondary = 103

let s:gui_error       = "#b53737"
let s:cterm_error     = 124 " Red3; Not same as gui color

let s:gui_fade        = "#3a3a3a" " Grey23
let s:cterm_fade      = 237

let s:gui_fade2       = "#1c1c1c" " Grey11
let s:cterm_fade2     = 234

let s:gui_white       = "#e4e4e4" " Grey89
let s:cterm_white     = 254

let s:gui_gold        = "#ffd700" " Gold1
let s:cterm_gold      = 220

let s:gui_black       = "#000000" " Black
let s:cterm_black     = 0

let s:gui_info        = "#767676" " Grey46
let s:cterm_info      = 243

let s:gui_warning     = "#af8700" " DarkGoldenrod
let s:cterm_warning   = 136

" Core
" ----

" - Editor -

call SetHi("Normal", "NONE", "NONE", s:cterm_base, "NONE", "NONE", s:gui_base, "NONE")
hi Cursor NONE
hi! link CursorLine ColorColumn
call SetHi("LineNr", "NONE", "NONE", s:cterm_fade, "NONE", "NONE", s:gui_fade, "NONE")
hi CursorLineNR NONE

" - Number column -

hi CursorColumn NONE
hi FoldColumn NONE
hi SignColumn NONE
call SetHi("Folded", "NONE", "NONE", s:cterm_info, "NONE", "NONE", s:gui_info, "NONE")

" - Window/Tab delimiters -

hi VertSplit NONE
call SetHi("ColorColumn", "NONE", "NONE", "NONE", s:cterm_fade2, "NONE", "NONE", s:gui_fade2)
hi TabLine NONE
hi TabLineFill NONE
hi TabLineSel NONE
call SetHi("TabLineSel", "NONE", "NONE", s:cterm_primary, "NONE", "NONE", s:gui_primary, "NONE")

" - File Navigation / Searching -

hi Directory NONE
call SetHi("Search", "NONE", "NONE", s:cterm_black, s:cterm_secondary, "NONE", s:gui_black, s:gui_secondary)
call SetHi("IncSearch", "NONE", "NONE", s:cterm_black, s:cterm_primary, "NONE", s:gui_black, s:gui_primary)

" - Prompt/Status -

hi StatusLine NONE
hi StatusLineNC NONE
hi WildMenu NONE
hi Question NONE
call SetHi("Title", "bold", "NONE", s:cterm_white, "NONE", "bold", s:gui_white, "NONE")
hi ModeMsg NONE
hi MoreMsg NONE

" - Visual aid -

call SetHi("MatchParen", "NONE", "bold", s:cterm_white, "NONE", "bold", s:gui_white, "NONE")
call SetHi("Visual", "NONE", "NONE", "NONE", s:cterm_fade, "NONE", "NONE", s:gui_fade)
hi VisualNOS NONE
call SetHi("NonText", "NONE", "NONE", s:cterm_fade, "NONE", "NONE", s:gui_fade, "NONE")

call SetHi("Todo", "NONE", "bold", s:cterm_black, s:cterm_gold, "bold", s:gui_black, s:gui_gold)
call SetHi("Underlined", "NONE", "underline", s:cterm_base, "NONE", "underline", s:gui_base, "NONE")
execute 'hi Underlined guisp=' . s:gui_base
hi Ignore NONE
hi SpecialKey NONE

hi Conceal NONE

call SetHi("Error", "NONE", "NONE", s:cterm_error, "NONE", "NONE", s:gui_error, "NONE")
hi! link ErrorMsg Error
hi! link DiagnosticError Error
call SetHi("Warning", "NONE", "NONE", s:cterm_warning, "NONE", "NONE", s:gui_warning, "NONE")
hi! link WarningMsg Warning
hi! link DiagnosticWarn Warning

" - Variable types -

hi Constant NONE
hi String NONE
hi StringDelimiter NONE
hi Character NONE
hi Number NONE
hi Boolean NONE
hi Float NONE

hi Identifier NONE
hi Function NONE

" - Language constructs -

hi Statement NONE
hi Conditional NONE
hi Repeat NONE
hi Label NONE
hi Operator NONE
hi Keyword NONE
hi Exception NONE
call SetHi("Comment", "NONE", "NONE", s:cterm_primary, "NONE", "NONE", s:gui_primary, "NONE")

call SetHi("Special", "NONE", "NONE", s:cterm_secondary, "NONE", "NONE", s:gui_secondary, "NONE")
hi SpecialChar NONE
hi Tag NONE
hi Delimiter NONE
hi SpecialComment NONE
hi Debug NONE

" - C like -

hi PreProc NONE
hi Include NONE
hi Define NONE
hi Macro NONE
hi PreCondit NONE

hi Type NONE
hi StorageClass NONE
hi Structure NONE
hi Typedef NONE

" - Diff -

hi diffAdded guifg=green
hi diffRemoved guifg=maroon
hi diffChanged guifg=orange

hi! link DiffAdd diffAdded
hi! link DiffChange diffChanged
hi! link DiffDelete diffRemoved
hi DiffText NONE

" - Completion menu -

call SetHi("Pmenu", "NONE", "NONE", "NONE", s:cterm_fade2, "NONE", "NONE", s:gui_fade2)
call SetHi("PmenuSel", "NONE", "NONE", "NONE", s:cterm_fade, "NONE", "NONE", s:gui_fade)
hi PmenuSbar NONE
hi! link PmenuThumb PmenuSel

" - Spelling -

call SetHi("SpellBad", "NONE", "NONE", s:cterm_error, "NONE", "NONE", s:gui_error, "NONE")
call SetHi("SpellCap", "NONE", "NONE", s:cterm_warning, "NONE", "NONE", s:gui_warning, "NONE")
hi! link SpellLocal SpellCap
hi! link SpellRare SpellCap

" Language specific
" -----------------

" - HTML -

hi! link htmlTag Folded
hi! link htmlTagName htmlTag
hi! link htmlEndTag htmlTag

" - LaTeX -

hi! link texDelim Normal
hi! link texCmdItem Special
hi! link texCmdPart texCmdItem
hi! link texMathDelimZoneTI texCmdItem
hi! link texMathEnvArgName Normal

" Extra
" -----

" - vim-matchup -

execute 'hi MatchWord gui=bold'

" - Pandoc -

hi! link pandocDelimitedCodeBlockLanguage Normal
call SetHi("pandocDelimitedCodeBlock", "NONE", "NONE", s:cterm_white, "NONE", "NONE", s:gui_white, "NONE")
hi! link texMathZone Normal

" - Indent blankline -

hi! link IndentBlanklineChar LineNr
hi! link IndentBlanklineContextChar Folded
hi! link IndentBlanklineContextStart MatchWord
" without the line below, there will be underline in IndentBlanklineContextStart
hi! MatchWord guisp=white

" - COC -

hi! link CocInlayHint LineNr
hi! link DiagnosticVirtualTextHint LineNr
hi! link CocHighlightText LineNr

hi! link CocErrorHighlight SpellBad
hi! link CocWarningHighlight SpellCap
hi! link CocUnusedHighlight CocWarningHighlight

hi! link CocListLine IncSearch
