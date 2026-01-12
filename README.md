# lon-cv

A simple way to manage your CV/resume. Write it once in Markdown, export to PDF, Word, and HTML.

## Why Use This?

**The problem:** Updating your CV in Word or Canva means reformatting every time. Different companies want different formats. It's tedious.

**The solution:** Write your CV in a simple text file (Markdown). Run one command. Get a professional PDF, Word doc, and web page — all matching, all formatted.

```
cv.md  →  build.sh  →  cv.pdf, cv.docx, cv.html
```

## Quick Start

### 1. Install the tools

You need two free tools: Pandoc (converts documents) and Typst (makes PDFs).

**Arch Linux:**
```bash
sudo pacman -S pandoc typst
```

**Ubuntu/Debian:**
```bash
sudo apt install pandoc
# For Typst, download from: https://github.com/typst/typst/releases
```

**macOS:**
```bash
brew install pandoc typst
```

**Windows:**
```bash
choco install pandoc typst
```
Or use [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) and follow the Linux instructions.

### 2. Clone this repo

```bash
git clone https://github.com/DadiiLon/lon-cv.git
cd lon-cv
```

### 3. Create your CV

```bash
cp cv-template.md cv.md
```

Now open `cv.md` in any text editor and replace the sample content with your info.

### 4. Build

```bash
./build.sh
```

Your files are in the `output/` folder:
- `cv.pdf` — for sending to employers
- `cv.docx` — if they want Word format
- `cv.html` — for web or preview

## Writing Your CV

The CV uses Markdown — a simple text format. Here's a quick reference:

```markdown
# Your Name                     <- Big heading (your name)
## Section                      <- Section headers (Experience, Education, etc.)
### Job Title — Company         <- Job entries
*Jan 2020 – Present*            <- Dates (italic)
**Bold text**                   <- Bold
- Bullet point                  <- Lists
[Link text](https://url.com)    <- Links
```

See `cv-template.md` for a complete example.

## Customization

### Change the accent color

Open `build.sh` and find:
```typ
#let accent = rgb("#000000")
```

Replace `#000000` with any color:
- `#000000` — Black (default)
- `#2563eb` — Blue
- `#059669` — Green
- `#dc2626` — Red

### Change the font

In `build.sh`, find:
```typ
#set text(font: "Noto Sans", ...)
```

Replace `"Noto Sans"` with any font installed on your system.

## Project Structure

```
lon-cv/
├── cv-template.md    # Example CV to copy from
├── cv.md             # Your CV (create this, git-ignored)
├── build.sh          # The build script
├── templates/
│   └── cv.css        # Styling for HTML output
└── output/           # Generated files go here (git-ignored)
    ├── cv.pdf
    ├── cv.docx
    └── cv.html
```

## FAQ

**Q: I get "command not found" when running `./build.sh`**

Make sure the script is executable:
```bash
chmod +x build.sh
```

**Q: The PDF looks wrong or has missing fonts**

Make sure you have Noto Sans installed, or change the font in `build.sh` to one you have.

**Q: Can I use this on Windows without WSL?**

Yes, but you'll need to convert `build.sh` to a batch file or PowerShell script. The commands are the same — just Pandoc and Typst.

**Q: How do I add a photo?**

Markdown doesn't handle photos well in PDFs. For now, this template is text-only. You can add a photo manually to the final PDF if needed.

## Inspiration

Inspired by [luca-cv](https://github.com/lucafrance/luca-cv) — a similar project using LaTeX.

## License

MIT — use it however you want.
