return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "gopls", "rust_analyzer"},
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local on_attach = function(client, buffer)
        vim.cmd([[
          augroup formatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
          autocmd BufWritePre <buffer> lua OrganizeImports(1000)
          augroup END
        ]])
      end

      -- organize imports
      -- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
      function OrganizeImports(timeoutms)
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
        for _, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
            else
              vim.lsp.buf.execute_command(r.command)
            end
          end
        end
      end

      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            analyses = {
              shadow = true,
            },
            completeUnimported = true,
            gofumpt = true,
            staticcheck = true,
          },
        },
        filetypes = { "go", "gomod" },
        flags = {
          debounce_text_changes = 150,
        },
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "rustup", "run", "stable", "rust-analyzer",
        }
      })
      vim.keymap.set('n', 'n', vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    end
  }
}
