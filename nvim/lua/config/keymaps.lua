-- Keymaps
local keymap = vim.keymap.set

-- Clear highlights with space
keymap("n", "<Space>", "<cmd>nohlsearch<CR>", { silent = true })

-- Buffer navigation with Tab
keymap("n", "<Tab>", "<cmd>bnext<CR>", { silent = true })
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { silent = true })

-- Insert mode navigation
keymap("i", "<C-a>", "<C-o>0", { desc = "Move to start of line" })
keymap("i", "<C-e>", "<C-o>$", { desc = "Move to end of line" })

-- File explorer toggle
keymap("n", "<C-m>", function()
  vim.cmd("NvimTreeToggle")
  vim.cmd("TagbarToggle")
end, { desc = "Toggle file explorer and tagbar" })

-- Fuzzy finder
keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<C-r>", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
