local config = {}

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.nvim_compe()
  require'compe'.setup {
    enabled = true;
    debug = false;
    min_length = 1;
    allow_prefix_unmatch = false;
    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      spell = true;
      tags = true;
      nvim_lua = true;
    };
  }
end

return config
