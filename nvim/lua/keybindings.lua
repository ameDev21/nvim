local keymap = vim.api.nvim_set_keymap

-- navigate in the split screen with Ctrl-wdjk
local opts = { noremap = true }
keymap("n", "<C-s>", "<C-w>j", opts)
keymap("n", "<C-j>", "<C-w>h", opts)
keymap("n", "<C-w>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-f>", "<C-f>", opts)
local function nkeymap(key, map)
  keymap("n", key, map, opts)
end

-- move selected lines
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- rename all the occurence of a function or variable and stuff
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

-- LSP
nkeymap("gd", ":lua vim.lsp.buf.definition()<cr>")
nkeymap("gD", ":lua vim.lsp.buf.declaration()<cr>")
nkeymap("gI", ":lua vim.lsp.buf.implementation()<cr>")
nkeymap("gw", ":lua vim.lsp.buf.document_symbol()<cr>")
nkeymap("gw", ":lua vim.lsp.buf.workspace_symbol()<cr>")
nkeymap("gr", ":lua vim.lsp.buf.references()<cr>")
nkeymap("gt", ":lua vim.lsp.buf.type_definition()<cr>")
nkeymap("K", ":lua vim.lsp.buf.hover()<cr>")
-- nkeymap("<C-L>", ":lua vim.lsp.buf.signature_help()<cr>")
nkeymap("<leader>af", ":lua vim.lsp.buf.code_action()<cr>")
nkeymap("<leader>rn", ":lua vim.lsp.buf.rename()<cr>")

-- tree-plugin
nkeymap("<C-o>", ":NvimTreeToggle<cr>")

-- Telescope settings
local builtin = require("telescope.builtin")

vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fs", builtin.live_grep, {})
vim.keymap.set("n", "fb", builtin.buffers, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})
-- Lua
vim.keymap.set("n", "xX", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "xW", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "xD", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "xL", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "xQ", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
-- CMake
keymap("", "cg", ":CMakeGenerate<cr>", {})
keymap("", "cb", ":CMakeBuild<cr>", {})
keymap("", "cq", ":CMakeClose<cr>", {})
keymap("", "cc", ":CMakeClean<cr>", {})
-- Dap
keymap("n", "<C-b>", ":lua require('dap').toggle_breakpoint()<cr>", {})
keymap("n", "<C-d>", ":lua require('dap').continue()<cr>", {})
keymap("n", "<C-f>", ":lua require('dap').step_over()<cr>", {})
keymap("n", "<C-t>", ":lua require('dap').terminate()<cr>", {})
keymap("n", "<C-i>", ":lua require('dap').step_into()<cr>", {})
keymap("n", "<C-c>", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", {})
-- Zen
keymap("n", "<C-z>", ":ZenMode<cr>", {})

keymap("i", "jk", "<esc>", {})

keymap("i", "<A-[>", "[", {})
keymap("i", "èè", "{", {})
keymap("i", "<A-]>", "]", {})
