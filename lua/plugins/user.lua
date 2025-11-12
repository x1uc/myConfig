return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup{
      size = 12,
      open_mapping = [[<c-t>]],
      direction = 'horizontal',
      shade_terminals = true,
      start_in_insert = true,
    }
  end,
}
