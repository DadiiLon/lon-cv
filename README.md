# lon-cv

Simple Markdown CV — write once, export to PDF, DOCX, and HTML.

## How It Works

```
cv.md  →  build.sh  →  cv.pdf, cv.docx, cv.html
```

Edit a single Markdown file, run one command, get three formats.

## Requirements

- [Pandoc](https://pandoc.org/) — document converter
- [Typst](https://typst.app/) — PDF generation

### Arch Linux
```bash
sudo pacman -S pandoc typst
```

### Ubuntu/Debian
```bash
sudo apt install pandoc
# Typst: see https://github.com/typst/typst#installation
```

### macOS
```bash
brew install pandoc typst
```

### Windows
```bash
# With Chocolatey
choco install pandoc typst
# Or use WSL
```

## Usage

1. Copy the template:
   ```bash
   cp cv-template.md cv.md
   ```

2. Edit `cv.md` with your info

3. Build:
   ```bash
   ./build.sh
   ```

4. Find outputs in `output/` folder

## Customization

### Change accent color

In `build.sh`, find this line:
```typ
#let accent = rgb("#000000")
```
Change to any hex color (e.g., `"#2563eb"` for blue).

### Change font

In `build.sh`, find:
```typ
#set text(font: "Noto Sans", ...)
```
Replace with any installed font.

## Project Structure

```
lon-cv/
├── cv-template.md    # Starting template
├── cv.md             # Your CV (git-ignored)
├── build.sh          # Build script
├── templates/
│   └── cv.css        # HTML styling
└── output/           # Generated files (git-ignored)
    ├── cv.pdf
    ├── cv.docx
    └── cv.html
```

## Inspiration

Inspired by [luca-cv](https://github.com/lucafrance/luca-cv)

## License

MIT
