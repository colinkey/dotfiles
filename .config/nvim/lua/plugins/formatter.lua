return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettier' },
      ruby = { 'rubocop' },
      go = { 'gofmt' }
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true
    }
  },
  -- init = function()
  -- 	-- If you want the formatexpr, here is the place to set it
  -- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  -- end,
}
