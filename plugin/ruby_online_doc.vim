" This is step One of my tutorial on creating 
" a Vim plugin using ruby


" Exit quickly when already loaded.
if exists("g:loaded_ruby_online_doc")
  finish
endif

" Exit quicky if running in compatible mode
if &compatible
  echohl ErrorMsg
  echohl none
  finish
endif

" Check for Ruby functionality.
if !has("ruby")
  echohl ErrorMsg
  echon "Sorry, This tutorial requires ruby support."
  finish
endif


echohl WarningMsg
echo "Sucessful loading of ruby online doc (step one) "
echohl none

let g:loaded_ruby_online_doc = "true"


function! OnelineDoc()
  :ruby oneline_doc
endfunction

command RubyOnelineDoc :call OnelineDoc()

ruby << EOF
  def oneline_doc
    print "printout a cool message to the status bar"
  end
EOF

