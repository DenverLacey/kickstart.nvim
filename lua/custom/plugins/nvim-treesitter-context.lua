-- Context Topbar that helps to keep track of where in the code we are.

return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    local ts_ctx = require("treesitter-context")
    ts_ctx.setup({
      enable = true,
      max_lines = 1,
      line_numbers = true,
      multiline_threshold = 1,
      trim_scope = 'inner',
      mode = 'cursor'
    })
    vim.keymap.set("n", "[c", function()
      ts_ctx.go_to_context(vim.v.count1)
    end, { silent = true, desc = 'Goto Context' })
  end
}

