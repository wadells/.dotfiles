" Vim syntax file
" Language:     Test List
" Maintainer:   James Anderson <janderson2@isilon.com>
" Last Change:  04/04/2011


" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

let main_syntax = 'list'

" DECLARATIONS (simply a list of all declarations I found, in alphabetical order)
syn match lstDeclarations	"--\(assert\|cluster\|comment\|declare\|endif\|exit\|hardware\|if\|import\|include\|kill\|list\|log\|mail-to\|next\|pause\|power\|record\|reimage\|return\|repeat\|requirement\|sleep\|timeout\|testcase\|wait\|wend\|while\)"

" COMMENTS
syn match lstComments		"\(#.*\)\|\(--comment.*\)"

" FIELDS (a rather lengthy regular expression to validate, but necessary)
syn match lstFields		"\(wait\|nowait\|daemon\)\(:\)\(ignore\|noignore\|reverse\|expect\[.*\]\)\(:\)\(local\|node\[.*\]\|nodes\[.*\]\|client\[.*\]\|dna\[.*\]\|storage\[.*\]\|nanon\[.*\]\|windows\[.*\]\|linux\[.*\]\|s_node\[.*\]\|s_dna\[.*\]\|s_storage\[.*\]\|s_nanon\[.*\]\|$$\w\+\)\(:\)\(continue\|cont\|nocontinue\|nocont\)\(:\)"

" VARIABLES
syn match lstVariables		"$$\w\+"


" EMBEDDED LANGUAGES (in the future, would like to use their actual syntax highlighting)
if main_syntax != 'python'
    syn include @listPython syntax/python.vim
    unlet b:current_syntax
    syn region python matchgroup=lstSnip start="<?python" end="?>" contains=@listPython
endif

if main_syntax != 'perl'
    syn include @listPerl syntax/perl.vim
    unlet b:current_syntax
    syn region perl matchgroup=lstSnip start="<?perl" end="?>" contains=@listPerl
endif

let b:current_syntax = "list"


" setup default highlighting
hi def link lstDeclarations		Statement
hi def link lstComments			Comment
hi def link lstVariables		Type
hi def link lstFields			Constant
hi def link lstSnip			SpecialComment

