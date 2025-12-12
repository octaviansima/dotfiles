return {
  {
    "savq/melange-nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme melange")
    end,
  },
  -- Alternative colorschemes you had
  {
    "xero/miasma.nvim",
    lazy = true,
  },
}
