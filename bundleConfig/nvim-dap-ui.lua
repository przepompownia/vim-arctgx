vim.cmd([[
    function s:reloadColors()
      highlight link DapUIVariable Normal
      highlight DapUIScope guifg=#455284
      highlight DapUIType guifg=#456519
      highlight link DapUIValue Normal
      highlight DapUIModifiedValue guifg=#455284 gui=bold
      highlight DapUIDecoration guifg=#455284
      highlight DapUIThread guifg=#A9FF68
      highlight DapUIStoppedThread guifg=#455284
      highlight link DapUIFrameName Normal
      highlight DapUISource guifg=#3E6B00
      highlight DapUILineNumber guifg=#455284
      highlight DapUIFloatBorder guifg=#455284
      highlight DapUIWatchesEmpty guifg=#666666
      highlight DapUIWatchesValue guifg=#A9FF68
      highlight DapUIWatchesError guifg=#8E2E28
      highlight DapUIBreakpointsPath guifg=#455284
      highlight DapUIBreakpointsInfo guifg=#A9FF68
      highlight DapUIBreakpointsCurrentLine guifg=#A9FF68 gui=bold
      highlight link DapUIBreakpointsLine DapUILineNumber
    endfunction
    augroup DapUiReloadColors
      autocmd!
      autocmd ColorScheme *
            \ call s:reloadColors()
    augroup END
    nnoremap <silent> <Plug>(ide-debugger-ui-toggle) :lua require'dapui'.toggle()<CR>
    xmap <Plug>(ide-debugger-eval-popup) <Cmd>lua require('dapui').eval()<CR>
]])
require('dapui').setup({
  mappings = {
    expand = { '<CR>', '<Right>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
  },
  sidebar = {
    elements = {
      {
        id = 'scopes',
        size = 0.25,
      },
      { id = 'watches', size = 0.25 },
      { id = 'stacks', size = 0.25 },
      { id = 'breakpoints', size = 0.25 },
    },
    size = 40,
    position = 'left',
  },
  tray = {
    elements = { 'repl' },
    size = 10,
    position = 'bottom',
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = 'single',
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
})
