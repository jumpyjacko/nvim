require("mini.base16").setup {
  palette = {
    base00 = '#1d1f21', -- Default Background
    base01 = '#1d1f21', -- Lighter Background
    base02 = '#2b303b', -- Selection Background
    base03 = '#707880', -- Comments, Invisibles, Line Highlighting
    base04 = '#707880', -- Dark Foreground
    base05 = '#c5c8c6', -- Default Foreground
    base06 = '#c5c8c6', -- Light Foreground
    base07 = '#c5c8c6', -- Light Background
    base08 = '#bf616a', -- Variables
    base09 = '#bf616a', -- Integers
    base0A = '#ebcb8b', -- Classes
    base0B = '#a3be8c', -- Strings
    base0C = '#8fa1b3', -- Support
    base0D = '#8fa1b3', -- Functions
    base0E = '#b48ead', -- Keywords
    base0F = '#96b5b4', -- Keywords
  },
  use_cterm = true,
  plugins = {
      default = false,
  }
}
