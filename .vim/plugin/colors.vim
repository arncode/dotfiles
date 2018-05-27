let s:bg = 0
let s:fg = 7
let s:grey = 8
let s:red = 9
let s:green = 10
let s:yellow = 11
let s:blue = 12
let s:magenta = 13
let s:cyan = 14
let s:white = 15

let s:grey242 = 242

execute ("hi Normal ctermfg=" . s:fg)
execute ("hi Visual ctermbg=" . s:grey242)
execute ("hi Search ctermbg=" . s:grey242)
execute ("hi LineNr ctermfg=" . s:fg)

execute ("hi Comment ctermfg=" . s:grey)
execute ("hi Constant ctermfg=" . s:blue)
execute ("hi Statement ctermfg=" . s:yellow)
execute ("hi Type ctermfg=" . s:yellow)
execute ("hi String ctermfg=" . s:red)

execute ("hi xmlTag ctermfg=" . s:blue)
execute ("hi xmlEndTag ctermfg=" . s:blue)
execute ("hi xmlTagName ctermfg=" . s:blue)

