return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		require("conform").setup({
			formatters_by_ft = {
				-- lua = { "stylua" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				cs = { "csharpier", lsp_format = "never" },
				go = { "gofmt" },
			},
			formatters = {
				csharpier = {
					command = vim.fn.stdpath("data") .. "/mason/bin/csharpier",
					args = { "format" },
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			conform.format({
				lsp_format = "fallback",
			})
		end)
	end,
}
