set background=dark

hi Normal ctermbg=NONE
hi nonText ctermbg=NONE
"Normal text
hi Normal ctermbg=235 ctermfg=254

"Comments like these
hi Comment ctermfg=248 cterm=italic "gray

"any constant terms
hi Constant ctermfg=147 
	hi String ctermfg=215
	hi Character ctermfg=169

hi Identifier ctermfg=blue

hi Function ctermfg=45 
 
hi mylangVariable ctermfg=red

"int, double, char, this, etc
hi Type ctermfg=80 "lightGreen, 156
       "static, register, volatile, etc.
	hi StorageClass cterm=bold ctermfg=113 "static, 120

"Preprocessor (import, #define, #include)
hi PreProc ctermfg=45 "141

"Any statement: if, else, for, while
hi Statement ctermfg=11 "cterm=bold "185, 87, 204
	"new, +/-
	hi Operator cterm=italic ctermfg=228  "215
	"try, catch, throw
	hi Exception ctermfg=183

"<-- these line numbers
hi LineNr ctermfg=179 ctermbg=236 

"Any special symbol: \n, \t, 
hi Special ctermfg=7 "169, look into better ones for this

"any wrong syntax
"hi Error ctermfg=160 ctermbg=246

"unknown words from the spell checker
hi SpellBad    ctermfg=white ctermbg=4

"when searching for words using /'searchWord'
hi Search ctermbg=74
 
"------------------------------------------------------------
syn keyword cFunctions printf scanf
hi link cFunctions Identifier 
