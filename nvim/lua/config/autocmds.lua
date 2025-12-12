-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Resize splits when window is resized
autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end,
})

-- Enable spell checking for text files
autocmd("FileType", {
  pattern = { "text", "markdown", "html", "tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Don't conceal quotes in JSON files
autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Close some windows with q
autocmd("FileType", {
  pattern = { "help", "startuptime", "qf" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto create directories when saving
autocmd("BufWritePre", {
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Disable all diagnostics for Python files
autocmd("FileType", {
  pattern = "python",
  callback = function(event)
    vim.diagnostic.disable(event.buf)
  end,
})
