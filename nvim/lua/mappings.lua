require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local dap = require("dap")
local dapui = require("dapui")
local current_buf = vim.api.nvim_get_current_buf()

-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save file" })

-- Remove search highlights after searching
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- window keymaps
map("n", "<leader-w>1", "<cmd>wincmd =<CR>", { desc = "Equalize window sizes", noremap = true })
map('n', '<C-Up>', ':resize -4<CR>')
map('n', '<C-Down>', ':resize +4<CR>')
map('n', '<C-Left>', ':vertical resize -4<CR>')
map('n', '<C-Right>', ':vertical resize +4<CR>')

-- Stay in indent mode
-- map("v", "<", "<gv", { desc = "Indent left in visual mode" })
-- map("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Terminal keymaps
map('t', '<esc>', [[<C-\><C-n>]], {desc="exit to normal mode when in terminal"})
map('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
map('t', '<C-w>', [[<C-\><C-n><C-w>]])

-- telescope 
map("n","<leader>ss",":Telescope persisted<CR>",{desc="show list of sessions"})
map("n","<leader>o",":Telescope lsp_document_symbols<CR>",{desc="code outline from lsp"})

-- lsp mappings 
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })

-- todo file
map("n", "<Leader>to", function()
    vim.cmd("40vsplit ~/todo.md")
end, { noremap = true, silent = true, desc = "Open todo.md in horizontal split" })

-- debugging

map("n", "<leader>du", dapui.toggle, { desc = "Dap UI Toggle" })
map("n", "<leader>dc", dap.continue, { desc = "Dap Continue" })
map("n", "<leader>dn", dap.step_over, { desc = "Dap Next" })
map("n", "<leader>ds", dap.step_into, { desc = "Dap Step Into" })
map("n", "<leader>do", dap.step_out, { desc = "Dap Step Out" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Dap Toggle Breakpoint" })
map("n", "<leader>dr", dap.repl.toggle, { desc = "Dap Repl Toggle" })
map({"n", "x"}, "<leader>de", dapui.eval, { desc = "Dap Eval" })
map("n", "<leader>dxb", dap.clear_breakpoints, { desc = "Dap Clear Breakpoints" })

map('n', '<leader>tm', '<cmd>JavaTestRunCurrentMethod<cr>', { desc = 'Run Current Method' })
map('n', '<leader>tc', '<cmd>JavaTestRunCurrentClass<cr>', { desc = 'Run Current Class' })
map('n', '<leader>td', '<cmd>JavaTestDebugCurrentMethod<cr>', { desc = 'Debug Current Method' })

-- diagnostics
map('n','<leader>df',function ()
    require('telescope.builtin').diagnostics({ bufnr = current_buf })
end,{desc="load diagnostics for current file"})

