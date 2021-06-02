local bind = require('keymap.bind')
local map_cr = bind.map_cr

local plug_map = {
  -- Plugin nvim-tree
  ["n|<Leader>e"] = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
  ["n|<Leader>F"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
