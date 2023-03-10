require("remap")
require("settings")
require("pack")
require("mason").setup()
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/.notes/work",
                    home = "~/.notes/home",
                }
            }
        }
    }
}

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})


lsp.setup()
