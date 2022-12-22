require('noice').setup({
  messages = {
    view = 'mini',
    view_search = false,
    view_error = 'mini',
    view_warn = 'mini',
  },
  notify = {
    enabled = true,
    view = 'mini',
  },
  lsp = {
    override = {
      -- ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      -- ["vim.lsp.util.stylize_markdown"] = true,
      -- ["cmp.entry.get_documentation"] = true,
    },
    signature = {
      enabled = false,
    },
    hover = {
      enabled = false,
    }
  },
  views = {
    mini = {
      timeout = 5000,
    },
  },
})

vim.keymap.set('c', '<A-CR>', function()
  require('noice').redirect(vim.fn.getcmdline())
  vim.api.nvim_input('<esc>')
end, { desc = 'Redirect Cmdline' })
