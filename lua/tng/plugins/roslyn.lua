return {
  -- "seblyng/roslyn.nvim",
  -- ft = "cs",
  -- ---@module 'roslyn.config'
  -- ---@type RoslynNvimConfig
  -- opts = {
  --   args = {
  --     "--stdio", "--logLevel=Information", "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path())
  --   },
  --   --[[
  -- -- args can be used to pass additional flags to the language server
  --   ]]
  --
  --   -- "auto" | "roslyn" | "off"
  --   --
  --   -- - "auto": Does nothing for filewatching, leaving everything as default
  --   -- - "roslyn": Turns off neovim filewatching which will make roslyn do the filewatching
  --   -- - "off": Hack to turn off all filewatching. (Can be used if you notice performance issues)
  --   filewatching = "roslyn",
  --   -- Whether or not to lock the solution target after the first attach.
  --   -- This will always attach to the target in `vim.g.roslyn_nvim_selected_solution`.
  --   -- NOTE: You can use `:Roslyn target` to change the target
  --   lock_target = false,
  -- }
}
