local fn = vim.fn
-- Everything
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
	-- Gihub Color theme and basic configuration
	use({
  	'projekt0n/github-nvim-theme',
  	config = function()
  		end
	})

	-- Neotree
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		  "MunifTanjim/nui.nvim",
		  {
			-- only needed if you want to use the commands with "_with_window_picker" suffix
			's1n7ax/nvim-window-picker',
			tag = "v1.*",
			config = function()
			  require'window-picker'.setup({
				autoselect_one = true,
				include_current = false,
				filter_rules = {
				  -- filter using buffer options
				  bo = {
					-- if the file type is one of following, the window will be ignored
					filetype = { 'neo-tree', "neo-tree-popup", "notify" },

					-- if the buffer type is one of following, the window will be ignored
					buftype = { 'terminal', "quickfix" },
				  },
				},
				other_win_hl_color = '#e35e4f',
			  })
			end,
		  }
		},
		config = function ()
		  -- Unless you are still migrating, remove the deprecated commands from v1.x
		  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

		  -- If you want icons for diagnostic errors, you'll need to define them somewhere:
		  vim.fn.sign_define("DiagnosticSignError",
			{text = " ", texthl = "DiagnosticSignError"})
		  vim.fn.sign_define("DiagnosticSignWarn",
			{text = " ", texthl = "DiagnosticSignWarn"})
		  vim.fn.sign_define("DiagnosticSignInfo",
			{text = " ", texthl = "DiagnosticSignInfo"})
		  vim.fn.sign_define("DiagnosticSignHint",
			{text = "", texthl = "DiagnosticSignHint"})
		end
	}

	-- General LSP stuff
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  	use 'L3MON4D3/LuaSnip' -- Snippets plugin

end)

