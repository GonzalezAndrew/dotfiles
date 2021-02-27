let g:startify_custom_header = 
    \ map(split(system('fortune -ao | cowsay'), '\n'), '"   ". v:val')

let g:startify_session_dir = '~/.config/nvim/session'


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Documents/GitHub/GonzalezAndrew',
            \ '~/Documents/GitHub/andrew-gonzalez',
            \ ]

let g:startify_enable_special = 0

" fortune -ao | cowsay -f "$(cowsay -l | sed '1d' | tr ' ' '\n' | sort -R | head -1)"