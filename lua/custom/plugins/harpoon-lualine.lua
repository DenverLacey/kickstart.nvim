-- Add a harpoon indicator to your Neovim Lualine!

return {
  "letieu/harpoon-lualine",
  dependencies = {
    "nvim-lualine/lualine.nvim",
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
    }
  },
}

