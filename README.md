# colorcache.nvim

A simple Neovim plugin that remembers your last selected colorscheme across sessions.

## Features

- Persists your colorscheme choice between Neovim sessions
- Provides an interactive colorscheme picker
- Automatically loads your last selected colorscheme on startup
- Fallbacks gracefully to default colorscheme if cached scheme is not available

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
  "irohn/colorcache.nvim",
  config = function()
    require("colorcache").setup()
  end
}
```

## Usage

The plugin provides the `:Colorcache` command which opens an interactive picker showing all installed colorschemes. 
Select a colorscheme to:
1. Apply it immediately
2. Save it as your preferred choice for future Neovim sessions

## Configuration

The plugin works out of the box with default settings, but you can customize it:

```lua
require("colorcache").setup({
  -- Path where the colorscheme choice is saved
  -- Defaults to stdpath("cache")/colorcache
  color_file = "/custom/path/to/cache"
})
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
