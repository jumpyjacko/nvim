return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
      columns = {
          "icon",
      },
      view_options = {
          show_hidden = true,
      },
      confirmation = {
          min_height = { 1, 0.1 }
      },
      float = {
          preview_slipt = "right"
      }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
