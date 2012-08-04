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
  echon "Sorry, This plugin in ruby online doc requires ruby support."
  finish
endif

"Uncomment if you want some knind of message on starting of VIM
"echohl WarningMsg
"echo "Some message that appears on VIM startup (maybe something like you looking great today) "
"echohl none

let g:loaded_ruby_online_doc = "true"


function! OnelineDoc()
  :ruby oneline_doc
endfunction

command RubyOnelineDoc :call OnelineDoc()

ruby << EOF
  def oneline_doc
    select_word  = VIM::evaluate("expand('<cword>')")
    type_of_file = VIM::evaluate("&ft")
    if type_of_file =="ruby" 
      system("open http://railsapi.com/doc/rails-v2.3.8_ruby-v1.8/?q=" + select_word )
      system("open http://www.ruby-doc.org/search.html?q=" + select_word )
    elsif type_of_file =="javascript"
      system("open https://developer.mozilla.org/en-US/search?q=javascript+" + select_word)
    else
      system("open http://www.google.com/search?as_q=" + select_word )
    end
    print "Please check your webbrowser for open tabs"
  end
EOF

