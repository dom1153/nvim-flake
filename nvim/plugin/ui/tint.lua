if vim.g.did_load_tint_plugin then
  return
end
vim.g.did_load_tint_plugin = true

-- :help tint-setup
require('tint').setup {
  tint = -45,
  saturation = 0.6,
  transforms = require('tint').transforms.SATURATE_TINT,
  tint_background_colors = false,
  highlight_ignore_patterns = { 'WinSeparator', 'Status.*' },
  window_ignore_function = function(winid)
    local bufid = vim.api.nvim_win_get_buf(winid)
    local buftype = vim.api.nvim_buf_get_option(bufid, 'buftype')
    local floating = vim.api.nvim_win_get_config(winid).relative ~= ''

    -- Do not tint `terminal` or floating windows, tint everything else
    return buftype == 'terminal' or floating
  end,
}
