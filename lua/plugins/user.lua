
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      size = 12,
      open_mapping = [[<c-\>]],
      direction = 'horizontal',
      shade_terminals = true,
      start_in_insert = true,
    }
  end,
}
