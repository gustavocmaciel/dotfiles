return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    }
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          window = {
            window = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  }
}
