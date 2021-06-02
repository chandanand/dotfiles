local fn, lsp = vim.fn, vim.lsp
local lspconfig = require('lspconfig')
local global = require('core.global')

if not packer_plugins['lspsaga.nvim'].loaded then
  vim.cmd [[packadd lspsaga.nvim]]
end

local saga = require('lspsaga')
saga.init_lsp_saga({
  code_action_icon = '💡'
})

function _G.reload_lsp()
  lsp.stop_client(lsp.get_active_clients())
  vim.cmd [[edit]]
end

function _G.open_lsp_log()
  local path = lsp.get_log_path()
  vim.cmd("edit " .. path)
end

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')

local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = true,
    signs = {
      enable = true,
      priority = 20
    },
    update_in_insert = false
  }
)

local sumneko_root_path = global.home.."/.lsp/lua-language-server"
local sumneko_binary = global.home.."/.lsp/lua-language-server/bin/macOS/lua-language-server"
lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        globals = {'vim'}
      },
      workspace = {
        library = {[fn.expand('$VIMRUNTIME/lua')] = true, [fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
      }
    }
  }
}
