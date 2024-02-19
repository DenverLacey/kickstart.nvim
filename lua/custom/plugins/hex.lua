-- Hex editing done right.
-- Shift address lines around, edit and delete bytes, it will all work itself out on :w.

--[[ Default config
      -- cli command used to dump hex data
      dump_cmd = 'xxd -g 1 -u',

      -- cli command used to assemble from hex data
      assemble_cmd = 'xxd -r',

      -- function that runs on BufReadPre to determine if it's binary or not
      is_buf_binary_pre_read = function()
        -- logic that determines if a buffer contains binary data or not
        -- must return a bool
      end,

      -- function that runs on BufReadPost to determine if it's binary or not
      is_buf_binary_post_read = function()
        -- logic that determines if a buffer contains binary data or not
        -- must return a bool
      end,
--]]

return {
  'RaafatTurki/hex.nvim',
  config = function()
    require('hex').setup()
    vim.keymap.set('n', '<leader>hd', ':HexDump<cr>', { desc = 'Switch to hex view.' })
    vim.keymap.set('n', '<leader>ha', ':HexAssemble<cr>', { desc = 'Switch to normal view from hex view.' })
    vim.keymap.set('n', '<leader>ht', ':HexToggle<cr>', { desc = 'Toggle between normal and hex view.' })
  end,
}

