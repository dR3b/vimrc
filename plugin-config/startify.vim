" Startify zeigt eine äußerst praktische Startseite an.

" Wir haben ein nicht-standardkonformes Sessiondir.
if has ("win64") || has("win32")
	if !isdirectory($HOME."/vimfiles/runtime/sessions")
		call mkdir($HOME."/vimfiles/runtime/sessions", "p")
	endif
 
	let g:startify_session_dir = $HOME."/vimfiles/runtime/sessions"
else
 	if !isdirectory($HOME."/.vim/runtime/sessions")
		call mkdir($HOME."/.vim/runtime/sessions", "p")
	endif
 
	let g:startify_session_dir = $HOME."/.vim/runtime/sessions"
endif

" Eine Funktion zum Formatieren des Headers... 
function! s:filter_header(lines) abort
	let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
	let centered_lines = map(copy(a:lines),
				\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
	return centered_lines
endfunction  

" ...und ein cooler Header.
let g:startify_custom_header = s:filter_header([
			\ ' _    __   ____   __  ___',
			\ '| |  / /  /  _/  /  |/  /',
			\ '| | / /   / /   / /|_/ /',
			\ '| |/ /  _/ /   / /  / /',
			\ '|___/  /___/  /_/  /_/',
			\ '',
			\ '',
			\ ])

" Dazu der passende Footer.
let g:startify_custom_footer = [
			\ '',
			\ '',
			\ "   Vim is charityware. Please read ':help uganda'.",
			\ ]

let g:startify_list_order = [
			\ ["   Recently used files:"],
			\ 'files',
			\ ["   Recently used files in this directory:"],
			\ 'dir',
			\ ["   Sessions:"],
			\ 'sessions',
			\ ]

" Ins VCS-Rootverzeichnis der gerade geöffneten Datei wechseln.
let g:startify_change_to_vcs_root = 1

" Wenn es kein VCS-Rootdir gibt, dann nicht.
let g:startify_change_to_dir = 0
