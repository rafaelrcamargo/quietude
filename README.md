# quietude

a carefully crafted dark theme for vs code, cursor, zed, neovim, ghostty, and bat that reduces visual clutter while staying readable. its low-contrast, muted colors are easy on the eyes, making it ideal for long coding sessions.

![preview](https://raw.githubusercontent.com/rafaelrcamargo/quietude/main/demo.png)

## installation

### vs code / cursor

1. open the extensions sidebar in vs code (`view → extensions`)
2. search for "quietude"
3. click install
4. click reload to restart vs code
5. go to `code → preferences → color theme` and select "quietude"

### neovim

quietude requires neovim 0.12 or newer. with neovim's native package manager:

```lua
vim.pack.add({
  { src = "https://github.com/rafaelrcamargo/quietude" },
}, { load = true })

vim.cmd.colorscheme("quietude")
```

configuration is optional and must run before `:colorscheme quietude`:

```lua
require("quietude").setup({
  transparent = true,
  terminal_colors = true,
})
```

transparent mode affects the main editing canvas and gutters; floating windows,
completion menus, and picker surfaces stay opaque for readability.

the neovim variant includes native ui, tree-sitter, lsp semantic token,
diagnostic, telescope, blink.cmp, gitsigns, copilot, and twilight highlights.

### ghostty

1. create `~/.config/ghostty/themes` if it does not exist
2. copy [`themes/quietude`](themes/quietude) to `~/.config/ghostty/themes/quietude`
3. add `theme = quietude` to `~/.config/ghostty/config.ghostty`
4. reload ghostty with `cmd + shift + ,` on macos or `ctrl + shift + ,` on linux

### bat

1. create `$(bat --config-dir)/themes` if it does not exist
2. copy [`themes/quietude.tmTheme`](themes/quietude.tmTheme) into that directory
3. run `bat cache --build`
4. use `bat --theme=quietude path/to/file`, or add `--theme="quietude"` to the file shown by `bat --config-file`

## customization

want to customize the theme? you can override specific colors in your vs code settings:

```json
"workbench.colorCustomizations": {
  "[quietude]": {
    "editor.background": "#1a1a1f",
    "editor.foreground": "#bab39c"
  }
}
```

## contributing

found a bug or have an idea? open an issue on [github](https://github.com/rafaelrcamargo/quietude/issues).

## license

mit license. see the [LICENSE](LICENSE) file for details.
