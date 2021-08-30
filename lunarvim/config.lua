-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["H"] = "^"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.visual_block_mode["H"] = "^"
lvim.keys.visual_block_mode["L"] = "$"
lvim.keys.normal_mode["#"] = "*"
lvim.keys.normal_mode["*"] = "#"
lvim.keys.normal_mode[";"] = ":"
lvim.keys.insert_mode["<C-a>"] = "<Home>"
lvim.keys.insert_mode["<C-e>"] = "<end>"
-- vim.api.nvim_set_keymap('n', "<S-h>", "^", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', "<S-l>", "$", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', "H", "^", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', "L", "$", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'tn', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'tp', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>jd",'<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "tm",':ToggleTerm<CR>', {noremap = true, silent = true, expr = false})

lvim.plugins  = {
  {
  "phaazon/hop.nvim",
  event = "BufRead",
  config = function()
    require("hop").setup()
    vim.api.nvim_set_keymap("n", "<leader><leader>f", ":HopChar1<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader><leader>l", ":HopLine<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader><leader>F", ":HopChar2<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader><leader>s", ":HopWord<cr>", { silent = true })
  end,
},
{
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  config = function()
    require "lsp_signature".setup()
  end
},
{
  "folke/trouble.nvim",
    cmd = "TroubleToggle",
},
{
  "iamcco/markdown-preview.nvim",
  run = "cd app && npm install",
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_start = 1
  end,
},
	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit", "gitrebase", "svn", "hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
  { "tpope/vim-repeat" },
  {
  "tpope/vim-surround",
  keys = {"c", "d", "y"}
},
{
  "jeffkreeftmeijer/vim-numbertoggle",
  config = function ()
    vim.api.nvim_set_keymap("n", "<leader>rn", ":set number relativenumber<cr>", {silent=true})
    vim.api.nvim_set_keymap("n", "<leader>n", ":set number norelativenumber<cr>", {silent=true})
  end
},
{
  'wfxr/minimap.vim',
  run = "cargo install --locked code-minimap",
  -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
  config = function ()
    vim.cmd ("let g:minimap_width = 10")
    vim.cmd ("let g:minimap_auto_start = 1")
    vim.cmd ("let g:minimap_auto_start_win_enter = 1")
  end,
},
{
  "ThePrimeagen/refactoring.nvim",
  config = function ()
    require("refactoring").setup()
    vim.api.nvim_set_keymap("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
    vim.api.nvim_set_keymap("v", "<Leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
  end
},
{
  "ishan9299/nvim-solarized-lua",
},
}
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
