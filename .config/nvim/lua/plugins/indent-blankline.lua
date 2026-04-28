return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "▏",       -- solid thin line; alternatives: "▏", "┊", "┆", "╎"
          tab_char = "▏",   -- same char for tab-indented code
        },
        scope = {
          enabled = true,   -- highlights the current scope's indentation
          show_start = false,
          show_end = false,
        },
      })
    end,
  },
}
