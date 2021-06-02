local bind = require('keymap.bind')
local global = require('core.global')
local map_cr = bind.map_cr
local map_cu = bind.map_cu

local plug_map = {
  -- Plugin Telescope
  ["n|<Leader>bb"] = map_cu('Telescope buffers'):with_noremap():with_silent(),
  ["n|<Leader>fb"] = map_cu('Telescope file_browser'):with_noremap():with_silent(),
  ["n|<Leader>ff"] = map_cu('Telescope find_files'):with_noremap():with_silent(),
  ["n|<Leader>fg"] = map_cu('Telescope git_files'):with_noremap():with_silent(),
  ["n|<Leader>fw"] = map_cu('Telescope grep_string'):with_noremap():with_silent(),
  ["n|<Leader>fl"] = map_cu('Telescope loclist'):with_noremap():with_silent(),
  ["n|<Leader>fc"] = map_cu('Telescope git_commits'):with_noremap():with_silent(),
  ["n|<Leader>ft"] = map_cu('Telescope help_tags'):with_noremap():with_silent(),
  ["n|<Leader>fd"] = map_cu('Telescope dotfiles path='..global.home..'/.dotfiles'):with_noremap():with_silent(),
  -- Plugin nvim-tree
  ["n|<Leader>e"] = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
  ["n|<Leader>F"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
