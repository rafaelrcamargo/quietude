local M = {}

local defaults = {
  transparent = false,
  terminal_colors = true,
}

M.options = vim.deepcopy(defaults)

local function clear_terminal_colors()
  vim.g.terminal_ansi_colors = nil
  for index = 0, 15 do
    vim.g["terminal_color_" .. index] = nil
  end
end

local function set_terminal_colors(colors)
  clear_terminal_colors()
  vim.g.terminal_ansi_colors = vim.deepcopy(colors)
  for index, color in ipairs(colors) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end

  local group = vim.api.nvim_create_augroup("quietude_terminal_colors", { clear = true })
  vim.api.nvim_create_autocmd("ColorSchemePre", {
    group = group,
    once = true,
    desc = "Remove Quietude terminal colors before switching themes",
    callback = clear_terminal_colors,
  })
end

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(defaults), options or {})
end

function M.load()
  vim.g.colors_name = nil
  vim.o.background = "dark"
  vim.cmd.highlight("clear")
  vim.g.colors_name = "quietude"

  local palette = require("quietude.palette")
  local groups = require("quietude.groups").get(palette, M.options)
  for name, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, name, spec)
  end

  if M.options.terminal_colors then
    set_terminal_colors(palette.terminal)
  else
    clear_terminal_colors()
  end
end

return M
