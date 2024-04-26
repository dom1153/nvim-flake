-- [[ NEOVIDE ; NVIM GUI ]]
local g = vim.g
local o = vim.o

-- Neovide
if g.neovide then
  g.neovide_fullscreen = false
  g.neovide_refresh_rate = 165

  g.neovide_cursor_animation_length = 0
  g.neovide_cursor_smooth_blink = true
  g.neovide_cursor_trail_size = 0

  g.neovide_scroll_animation_length = 0.15

  g.neovide_transparency = 0.9

  -- Neovide Fonts
  o.guifont = 'FiraCode Nerd Font Mono:Medium:h11'
end
