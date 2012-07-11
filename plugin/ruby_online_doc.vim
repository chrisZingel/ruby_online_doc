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
    select_word= VIM::evaluate("expand('<cword>')")
    type_of_file= VIM::evaluate("&ft")

    print "The word that your cursor is on (while in normal) mode is: " + select_word
    print "This type of file is: " + type_of_file
    system("open http://railsapi.com/doc/rails-v2.3.8_ruby-v1.8")

  end
EOF

