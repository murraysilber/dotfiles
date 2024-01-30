return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, {})
            vim.keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, {})
            vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
            vim.keymap.set('n', '<leader>fm',
                function() require('telescope.builtin').treesitter({ default_text = ":method:" }) end)
        end,
    },
}
