local dap = require 'dap'
local keymap = require 'vim.keymap'
local vim = vim

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/arctgx/.vim/pack/bundle/opt/arctgx/bundleConfig/vimspector-config/gadgets/linux/vscode-php-debug/out/phpDebug.js' }
}

vim.fn.sign_define('DapBreakpoint', {text='●', texthl='IdeBreakpointSign', linehl='', numhl='IdeBreakpointLineNr'})
vim.fn.sign_define('DapBreakpointCondition', {text='◆', texthl='IdeBreakpointSign', linehl='', numhl='IdeBreakpointLineNr'})
vim.fn.sign_define('DapBreakpointRejected', {text='R', texthl='IdeCodeWindowCurrentFrameSign', linehl='', numhl='IdeBreakpointLineNr'})
vim.fn.sign_define('DapLogPoint', {text='L', texthl='IdeCodeWindowCurrentFrameSign', linehl='', numhl='IdeBreakpointLineNr'})
vim.fn.sign_define('DapStopped', {text='▶', texthl='IdeCodeWindowCurrentFrameSign', linehl='CursorLine', numhl=''})

local opts = {silent = true, noremap = true}
keymap.set({'n'}, '<Plug>(ide-debugger-run)', dap.continue, opts)
keymap.set({'n'}, '<Plug>(ide-debugger-step-over)', dap.step_over, opts)
keymap.set({'n'}, '<Plug>(ide-debugger-step-into)', dap.step_into, opts)
keymap.set({'n'}, '<Plug>(ide-debugger-step-out)', dap.step_out, opts)
keymap.set({'n'}, '<Plug>(ide-debugger-toggle-breakpoint)', dap.toggle_breakpoint, opts)
keymap.set(
  {'n'},
  '<Plug>(ide-debugger-toggle-breakpoint-conditional)',
  function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
  opts
)
keymap.set({'n'}, '<Plug>(ide-debugger-up-frame)', dap.up, opts)
keymap.set({'n'}, '<Plug>(ide-debugger-down-frame)', dap.down, opts)
keymap.set({'n'}, '<Plug>(ide-debugger-run-to-cursor)', dap.run_to_cursor, opts)
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
