"NERDTreeを常に表示させる
"プラグインがあるらしい
NeoBundle 'jistr/vim-nerdtree-tabs'
    let g:nerdtree_tabs_open_on_console_startup=1

"NERDTreeのbuffer,hidden回りの挙動
"NERDTreeではset hiddenされていなくてmodフラグが立ってるバッファが
"previous windowの場合はOpen動作が"o" から "i"に変更されるぽい
"現状Window固有の情報はmodフラグしかないので、このフラグを立てるか
"自前でwindowローカルな変数を用意するしかなさそう
"windowのロック機構をつくりたいならこんな感じになりそう
"仕組みはNERDTree側のキーマップを上書きして自前のフラグを見てから
"追加の判断後にiなのかoなのか出しわける感じ
"
"使い方)
"以下を.vimrcに書く
"MyNERDTreeで開く
"固定したいWindowを選択してMyNERDTreeWindowLockでロック
"MyNERDTreeWindowUnLockで解除
"あとは普通にEnterで開けばロックしたWindowは避けるはず
command! -nargs=0 MyNERDTree NERDTreeToggle | call SetMyNERD()
command! -nargs=0 MyNERDTreeWindowLock let w:lock_window = 1
command! -nargs=0 MyNERDTreeWindowUnLock let w:lock_window = 0
function! SetMyNERD()
    nnoremap <buffer> <ENTER> :call MyNERDTreeOpenFile()<CR>
endfunction
function! MyNERDTreeOpenFile()
    wincmd p
    if !exists('w:lock_window')
        let w:lock_window = 0
    endif
    let l:lock = w:lock_window
    wincmd p
    let node = g:NERDTreeFileNode.GetSelected()
    if l:lock && !node.path.isDirectory
        call nerdtree#invokeKeyMap("i")
    else
        call nerdtree#invokeKeyMap("o")
    endif
endfunction
