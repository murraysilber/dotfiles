-- For conciseness
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- clear search highlights
keymap.set("n", "<leader>nh", ":noh<CR>", opts, { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", opts, { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", opts, { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", opts, { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts, { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts, { desc = "Make splits equal width and height" }) -- make split windows equal width and height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts, { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>sj", "<C-w>-", opts, { desc = "Make split windows height shorter" }) -- make split window height shorter
keymap.set("n", "<leader>sk", "<C-w>+", opts, { desc = "Make split windows height taller" }) -- make split windows height taller
keymap.set("n", "<leader>wl", "<C-w>>5", opts, { desc = "Make split window width bigger" }) -- make split windows width bigger 
keymap.set("n", "<leader>wh", "<C-w><5", opts, { desc = "Make split window width smaller" }) -- make split windows width smaller

-- Navigate between splits
keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Telescope
--keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {}) -- fuzzy find files in project
--keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {}) -- grep file contents in project
--keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {}) -- fuzzy find open buffers
--keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {}) -- fuzzy find help tags
--keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {}) -- fuzzy find in current file buffer
--keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {}) -- fuzzy find LSP/class symbols
--keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {}) -- fuzzy find LSP/incoming calls
-- keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({default_text=":method:"}) end) -- fuzzy find methods in current class
--keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({symbols={'function', 'method'}}) end) -- fuzzy find methods in current class
--keymap.set('n', '<leader>ft', function() -- grep file contents in current nvim-tree node
--  local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
--  if not success or not node then return end;
--  require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
--end)

-- Diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
