local M = {}

M.defaults = {
  color_file = vim.fn.stdpath("cache") .. "/colorcache"
}

local write_to_cache = function(file, content)
  file = io.open(file, "w")
  if file then
    file:write(content)
    file:close()
    return true
  end

  return false
end

local read_from_cache = function(file)
  file = io.open(file, "r")
  if file then
    local content = file:read()
    file:close()
    return content
  end

  return false
end

local get_installed_colors = function()
  return vim.fn.getcompletion("", "color")
end

M.color_picker = function()
  vim.ui.select(get_installed_colors(), {
    prompt = "Select a colorscheme:",
    format_item = function(item)
      return item
    end,
  }, function(selection)
    if selection then
      vim.cmd.colorscheme(selection)
      write_to_cache(M.defaults.color_file, selection)
    end
  end)
end

M.setup = function(opts)
  -- overwrite defaults with setup provided options
  M.defaults = vim.tbl_deep_extend("force", M.defaults, opts)

  -- Load cached colorscheme if present
  local cached_colorscheme = read_from_cache(M.defaults.color_file)
  if cached_colorscheme then
    local ok = pcall(vim.cmd.colorscheme, cached_colorscheme)
    if not ok then
      vim.cmd.colorscheme(vim.g.colors_name or "default")
    end
  end

  -- Create user command for color cache
  vim.api.nvim_create_user_command("Colorcache", function()
    M.color_picker()
  end, {})
end

return M

-- vim: ts=2 sts=2 sw=2 et
