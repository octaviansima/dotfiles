return {
  "neovim/nvim-lspconfig",
  ft = { "python", "typescript", "javascript" },
  config = function()
    -- LSP server configurations with filetype mappings
    local servers = {
      -- Python
      pyright = {
        filetypes = { "python" },
      },
      -- TypeScript/JavaScript
      ts_ls = {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
      },
    }

    -- Setup LSP attach function
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }
      
      -- Key mappings
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
      
      -- Diagnostic mappings
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
    end

    -- Setup capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

    -- Setup each server only for relevant filetypes
    local lspconfig = require("lspconfig")
    for server, config in pairs(servers) do
      config.on_attach = on_attach
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end

    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
