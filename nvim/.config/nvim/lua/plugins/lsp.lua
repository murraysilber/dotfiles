return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },

    -- Auto-Install LSPs, linters, formatters, debuggers
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/lazydev.nvim
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup {
      -- Install these LSPs automatically
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'lua_ls',
        'jsonls',
        'marksman',
        'quick_lint_js',
        'yamlls',
        'pylsp',
      },
    }

    require('mason-tool-installer').setup {
      -- Install these linters, formatters, debuggers automatically
      ensure_installed = {
        'ruff',
      },
    }

    -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
    vim.api.nvim_command 'MasonToolsInstall'

    local lspconfig = require 'lspconfig'
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    -- Call setup on each LSP server
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        }
      end,
    }

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
        },
      },
    }

    lspconfig.pylsp.setup {
      settings = {
        pylsp = {
          plugins = {
            pyflakes = { enabled = false },
            pycodestyle = { enabled = false },
            autopep8 = { enabled = false },
            yapf = { enabled = false },
            mccabe = { enabled = false },
            pylsp_mypy = { enabled = false },
            pylsp_black = { enabled = false },
            pylsp_isort = { enabled = false },
          },
        },
      },
    }

    lspconfig.ruff.setup {
      -- Notes on code actions: https://github.com/astral-sh/ruff-lsp/issues/119#issuecomment-1595628355
      -- Get isort like behavior: https://github.com/astral-sh/ruff/issues/8926#issuecomment-1834048218
      commands = {
        RuffAutofix = {
          function()
            vim.lsp.buf.execute_command {
              command = 'ruff.applyAutofix',
              arguments = {
                { uri = vim.uri_from_bufnr(0) },
              },
            }
          end,
          description = 'Ruff: Fix all auto-fixable problems',
        },
        RuffOrganizeImports = {
          function()
            vim.lsp.buf.execute_command {
              command = 'ruff.applyOrganizeImports',
              arguments = {
                { uri = vim.uri_from_bufnr(0) },
              },
            }
          end,
          description = 'Ruff: Format imports',
        },
      },
    }

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or 'rounded' -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end,
}
