{
  home.file.".ideavimrc".text = ''
    """ Editing and Reloading .ideavimrc
    nnoremap \e :e ~/.ideavimrc<CR>
    nmap \r <Action>(IdeaVim.ReloadVimRc.reload)

    """ Options
    set ideajoin
    set clipboard+=unnamed
    set number
    set relativenumber
    set ignorecase
    set smartcase
    set incsearch
    set hlsearch

    """ Plugins
    set surround
    set highlightedyank
    set commentary

    """ Key Mappings
    let mapleader=" "

    nnoremap <leader>x :noh<CR>
    nnoremap <leader>, :w<CR>
    nnoremap <C-s> :%s/
    nnoremap - <C-x>
    nnoremap + <C-a>
    nmap <leader>r <Action>(Run)
    nmap <leader>q <Action>(Stop)

    " Collapse/Expand
    nmap zk <Action>(CollapseRegion)
    nmap zj <Action>(ExpandRegion)
    nmap <leader>zk <Action>(CollapseAllRegions)
    nmap <leader>zj <Action>(ExpandAllRegions)

    " Window
    nnoremap <leader>wh <C-w>h
    nnoremap <leader>wl <C-w>l
    nnoremap <leader>wj <C-w>j
    nnoremap <leader>wk <C-w>k
    nmap <leader>wv <Action>(SplitVertically)
    nmap <leader>wo <Action>(MoveEditorToOppositeTabGroup)
    nmap <leader>wm <Action>(MaximizeEditorInSplit)

    " Goto*
    nmap gi <Action>(GotoImplementation)
    nmap gd <Action>(GotoDeclaration)
    nmap gp <Action>(GotoSuperMethod)
    nmap gt <Action>(GotoTest)
    nmap gD <Action>(GotoTypeDeclaration)
    nmap ]c <Action>(VcsShowNextChangeMarker)
    nmap [c <Action>(VcsShowPrevChangeMarker)
    nmap ]e <Action>(GotoNextError)
    nmap [e <Action>(GotoPreviousError)
    nmap K <Action>(ShowHoverInfo)

    " Debug
    nmap <leader>dr <Action>(Debug)
    nmap <leader>db <Action>(ToggleLineBreakpoint)

    " Refactor
    nmap <leader>re <Action>(RenameElement)

    " Search
    nmap <leader>ff <Action>(GotoFile)
    nmap <leader>fc <Action>(GotoClass)
    nmap <leader>ft <Action>(FindInPath)
    nmap <leader>fr <Action>(RecentFiles)

    " Zen Mode
    nmap <leader>zm <Action>(ToggleZenMode)
  '';
}

