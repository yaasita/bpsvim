# vim部 06

インデント

    # vimrcに書いておこうね！
    filetype plugin indent on

    コマンドの履歴
    q:
    
    検索の履歴
    q/

   # ノーマルモードでインデント増やす減らす 
    > <
    # 入力モードのときは
    Ctrl-d Ctrl-t

    # いい感じにインデントしてほしかったら
    = で直す
    ggで一番最初戻って =G

    # 桁位置を合わせたかったらちょっとみえる
    set cuc

    breakindent これ新機能

    shiftwidth これでインデント幅決める

    set expandtab
    :retab

    NeoBundle 'yaasita/rjcolor.git'
    NeoBundle 'flazz/vim-colorschemes'

