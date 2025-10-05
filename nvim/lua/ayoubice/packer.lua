local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})


return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'


    -- project
    use 'nvim-tree/nvim-tree.lua'

    use({
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup()
        end
    })

    -- syntaxe highlight
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- FZF
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- tmux
    use({
        'aserowy/tmux.nvim',
        config = function()
            require("tmux").setup()
        end
    })

    -- theme
    use {
        'shaunsingh/nord.nvim',
        config = function()
            -- Example config in lua
            -- vim.g.nord_contrast = true
            vim.g.nord_borders = true
            vim.g.nord_disable_background = true
            vim.g.nord_italic = false
            vim.g.nord_uniform_diff_background = true
            vim.g.nord_bold = false

            -- Load the colorscheme
            require('nord').set()
        end
    }

    -- LSP
    use "neovim/nvim-lspconfig"             -- enable LSP
    use "williamboman/mason.nvim"           -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim'   -- LSP diagnostics and code actions

    -- snippet
    use 'rafamadriz/friendly-snippets'
    use 'L3MON4D3/LuaSnip'

    -- AI
    -- use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' } -- sourcegraph

    use "zbirenbaum/copilot.lua"

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }

    use {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        requires = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
    }

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'



    -- autopair
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- debugger
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { "leoluz/nvim-dap-go", requires = { "mfussenegger/nvim-dap" } }

    use 'nvim-tree/nvim-web-devicons'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
