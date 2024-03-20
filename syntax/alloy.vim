" alloy.vim: Vim syntax file for Grafana Alloy syntax.

if exists('b:current_syntax')
  finish
end

syn keyword alloyTodo     contained TODO FIXME XXX BUG NOTE
syn keyword alloyConstant           true false null

syn region alloyComment start=/\/\// end=/$/    contains=alloyTodo
syn region alloyComment start=/\/\*/ end=/\*\// contains=alloyTodo

syn region alloyString start=/"/ end=/"/ contains=alloyEscape

syn match alloyEscape display contained "\\[0-7]\{3}"
syn match alloyEscape display contained +\\[abfnrtv\\'"]+
syn match alloyEscape display contained "\\x\x\{2}"
syn match alloyEscape display contained "\\u\x\{4}"
syn match alloyEscape display contained "\\U\x\{8}"
syn match alloyEscape display contained +\\[^0-7xuUabfnrtv\\'"]+

syn match alloyInt   "\<-\=\(0\|[1-9]_\?\(\d\|\d\+_\?\d\+\)*\)\%([Ee][-+]\=\d\+\)\=\>"
syn match alloyFloat "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=\>"
syn match alloyFloat "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=\>"

syn match  alloyBlockHeader /^[^=]\+{/ contains=alloyBlockName,alloyBlockLabel,alloyComment
syn match  alloyBlockName   /^\s*\([A-Za-z_][A-Za-z0-9_]*\)\(\.\([A-Za-z_][A-Za-z0-9_]*\)\)*/ skipwhite contained
syn region alloyBlockLabel  start=/"/ end=/"/ contained

hi def link alloyBlockName  Structure
hi def link alloyBlockLabel String
hi def link alloyString     String
hi def link alloyEscape     Special
hi def link alloyInt        Number
hi def link alloyFloat      Number
hi def link alloyConstant   Constant
hi def link alloyComment    Comment
hi def link alloyTodo       Todo

let b:current_syntax = 'alloy'
