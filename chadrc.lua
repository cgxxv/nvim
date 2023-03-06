local M = {}

M.ui = {
  -- theme_toggle = { "onedark", "one_light" },
  theme = "solarized_dark",
  transparency = true,
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M