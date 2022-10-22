local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "lua", "go" }, -- one of "all" or a list of languages
	auto_install = true,
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
	rainbow = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]a"] = "@parameter.outer",
				["]l"] = "@loop.outer",
				["]i"] = "@conditional.outer",
				["]f"] = "@function.outer",
			},
			goto_next_end = {
				["]A"] = "@parameter.outer",
				["]L"] = "@loop.outer",
				["]I"] = "@conditional.outer",
				["]F"] = "@function.outer",
			},
			goto_previous_start = {
				["[a"] = "@parameter.outer",
				["[l"] = "@loop.outer",
				["[i"] = "@conditional.outer",
				["[f"] = "@function.outer",
			},
			goto_previous_end = {
				["[A"] = "@parameter.outer",
				["[L"] = "@loop.outer",
				["[I"] = "@conditional.outer",
				["[F"] = "@function.outer",
			},
		},
	},
})
