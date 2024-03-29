local keymap = require('vim.keymap')

require('bqf').setup({
  auto_enable = true,
  preview = {
    win_height = 12,
    win_vheight = 12,
    delay_syntax = 80,
    border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'},
    should_preview_cb = function(bufnr)
      local ret = true
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local fsize = vim.fn.getfsize(filename)

      if vim.startswith(filename, 'fugitive://') then
        return false
      end
      -- file size greater than 100k can't be previewed automatically
      if fsize > 100 * 1024 then
        ret = false
      end
      return ret
    end
  },
  func_map = {
    open = '',
    vsplit = '',
    ptogglemode = 'z,',
    stoggleup = '',
  },
  filter = {
    fzf = {
      action_for = {['<CR>'] = 'TabDrop'},
      extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
    }
  }
})

local function tabDropHandler()
  require('bqf.qfwin.handler').open(true, 'TabDrop')
end

local function setItemMappings()
  keymap.set({'n'}, '<2-LeftMouse>', tabDropHandler, {buffer = true})
  keymap.set({'n'}, '<CR>', tabDropHandler, {buffer = true})
end

vim.api.nvim_create_augroup ('BqfMappings', {clear = true })
vim.api.nvim_create_autocmd ('FileType', {
  group = 'BqfMappings',
  pattern = 'qf',
  callback = setItemMappings,
})
