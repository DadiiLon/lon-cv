#!/bin/bash

# lon-cv build script
# Converts cv.md to PDF, DOCX, and HTML

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Building CV..."

# PDF via Typst
echo "  → PDF"
pandoc cv.md -o output/cv-content.typ

cat > output/cv.typ << 'TYPSTEOF'
// Clean CV Styling
#set document(title: "CV")
#set page(paper: "a4", margin: (x: 50pt, y: 45pt))
#set text(font: "Noto Sans", size: 10pt, fill: rgb("#1f2937"))
#set par(leading: 0.65em, justify: false)

#show heading.where(level: 1): it => {
  set text(size: 24pt, weight: "bold")
  it
  v(-2pt)
}

#show heading.where(level: 2): it => {
  v(10pt)
  set text(size: 10pt, weight: "bold")
  upper(it.body)
  v(-6pt)
  line(length: 100%, stroke: 0.75pt + rgb("#000000"))
  v(4pt)
}

#show heading.where(level: 3): it => {
  v(6pt)
  set text(size: 10pt, weight: "semibold")
  it
  v(-4pt)
}

#show link: it => text(fill: rgb("#000000"))[#it]
#show emph: it => text(fill: rgb("#6b7280"), size: 9pt)[#it]
#show strong: it => text(weight: "semibold")[#it]
#set list(indent: 10pt, marker: text(size: 8pt)[•])
#let horizontalrule = { v(6pt); line(length: 100%, stroke: 0.5pt + rgb("#e5e7eb")); v(6pt) }

TYPSTEOF

cat output/cv-content.typ >> output/cv.typ
typst compile output/cv.typ output/cv.pdf
rm output/cv-content.typ output/cv.typ

# DOCX
echo "  → DOCX"
pandoc cv.md -o output/cv.docx

# HTML
echo "  → HTML"
pandoc cv.md -o output/cv.html --standalone --css=templates/cv.css --embed-resources

echo "Done! Files in output/"
ls -lh output/
