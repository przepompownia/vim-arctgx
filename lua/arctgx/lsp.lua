local api = vim.api
local lsp = require('vim.lsp')
local diagnostic = require('vim.diagnostic')
local keymap = require('vim.keymap')

local M = {
}

local print_workspace_folders = function ()
  print(vim.inspect(lsp.buf.list_workspace_folders()))
end

function M.on_attach(client, bufnr)
  local function buf_map(modes, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap or true
    opts.silent = opts.silent or true
    keymap.set(modes, lhs, rhs, opts)
  end

  local function buf_set_option(...) api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_map('n', '<Plug>(ide-goto-definition)', lsp.buf.definition)
  buf_map('n', '<Plug>(ide-hover)', lsp.buf.hover)
  buf_map('n', '<Plug>(ide-goto-implementation)', lsp.buf.implementation)
  buf_map({'n', 'i'}, '<Plug>(ide-show-signature-help)', lsp.buf.signature_help)
  buf_map('n', '<Plug>(ide-list-workspace-symbols)', lsp.buf.workspace_symbol)
  buf_map('n', '<Plug>(ide-list-document-symbols)', lsp.buf.document_symbol)
  buf_map('n', '<Plug>(ide-action-rename)', lsp.buf.rename)
  buf_map('n', '<Plug>(ide-find-references)', lsp.buf.references)
  buf_map('n', '<Plug>(ide-diagnostic-info)', diagnostic.open_float)
  buf_map('n', 'gD', lsp.buf.declaration)
  buf_map('n', '<space>wa', lsp.buf.add_workspace_folder)
  buf_map('n', '<space>wr', lsp.buf.remove_workspace_folder)
  buf_map('n', '<space>wl', print_workspace_folders)
  buf_map('n', '<space>D', lsp.buf.type_definition)
  buf_map('n', '<space>ca', lsp.buf.code_action)
  buf_map('n', '[d', diagnostic.goto_prev)
  buf_map('n', ']d', diagnostic.goto_next)
  buf_map('n', '<space>q', diagnostic.setloclist)
  buf_map('n', '<space>f', lsp.buf.formatting)

  if client.resolved_capabilities.document_highlight then
    api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#E6F4AA
      hi LspReferenceText cterm=bold ctermbg=red guibg=#F4EDAA
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#F4DBAA
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        " autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

return M
