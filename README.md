# quietude theme for vs code

a crafted dark theme that cuts visual clutter but stays readable. its low-contrast, muted colors are easy on the eyes, making it great for long coding sessions.

![preview](https://raw.githubusercontent.com/rafaelrcamargo/quietude/main/demo.png)

## color palette

the theme uses a selection of muted, earthy tones:

- **background**: `#1a1a1f`: deep, soft black
- **foreground**: `#bab39c`: warm beige for main text
- **comments**: `#565552`: subtle gray for non-intrusive comments
- **strings**: `#938f82`: muted brown
- **functions**: `#6c765c`: soft green
- **types/classes**: `#ca9e66`: warm orange
- **keywords**: `#73716b`: dusty brown
- **links/references**: `#6578a6`: soft blue
- **errors**: `#c15e55`: muted red

## installation

1. open the extensions sidebar in vs code (`view → extensions`)
2. search for "quietude"
3. click install
4. click reload to reload vs code
5. go to `code → preferences → color theme` and pick "quietude"

## customization

want to tweak the theme? you can override specific colors in your vs code settings:

```json
"workbench.colorCustomizations": {
  "[Quietude]": {
    "editor.background": "#1a1a1f",
    "editor.foreground": "#bab39c"
  }
}
```

## contributing

found a bug or have an idea? open an issue on [github](https://github.com/rafaelrcamargo/quietude/issues)

## license

mit license, see the [license](license) file for details
