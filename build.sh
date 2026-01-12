#!/bin/bash

# lon-cv build script
# Converts cv.md to PDF, DOCX, and HTML with custom styling

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Building CV..."

# PDF (two-step: md → typ → pdf with custom styling)
echo "  → PDF"
# Generate Typst content from Markdown
pandoc cv.md -o output/cv-content.typ

# Create final Typst file with styling + content
cat > output/cv.typ << 'TYPSTEOF'
// Modern CV Styling
#let accent = rgb("#000000")
#let text-light = rgb("#6b7280")

#set document(title: "CV - Marlon Sabido")
#set page(paper: "a4", margin: (x: 50pt, y: 45pt))
#set text(font: "Noto Sans", size: 10pt, fill: rgb("#1f2937"))
#set par(leading: 0.65em, justify: false)

// H1 - Name
#show heading.where(level: 1): it => {
  set text(size: 26pt, weight: "bold")
  it
  v(-2pt)
}

// H2 - Section headers
#show heading.where(level: 2): it => {
  v(12pt)
  box(width: 100%)[
    #set text(size: 9.5pt, weight: "bold", fill: accent)
    #upper(it.body)
    #v(-7pt)
    #line(length: 100%, stroke: 1.5pt + accent)
  ]
  v(4pt)
}

// H3 - Job titles
#show heading.where(level: 3): it => {
  v(6pt)
  set text(size: 10pt, weight: "semibold")
  it
  v(-4pt)
}

// Links
#show link: it => text(fill: accent)[#it]

// Emphasis (dates)
#show emph: it => text(fill: text-light, size: 9pt)[#it]

// Strong
#show strong: it => text(weight: "semibold")[#it]

// Lists
#set list(indent: 10pt, marker: text(fill: accent, size: 8pt)[●])

// Horizontal rule (Pandoc generates #horizontalrule)
#let horizontalrule = { v(6pt); line(length: 100%, stroke: 0.5pt + rgb("#e5e7eb")); v(6pt) }

// Tables
#set table(stroke: none, inset: (x: 0pt, y: 5pt))
#show table.cell.where(y: 0): set text(weight: "semibold", fill: text-light, size: 9pt)

TYPSTEOF

# Append the content (skip first line which is usually empty)
cat output/cv-content.typ >> output/cv.typ

# Compile to PDF
typst compile output/cv.typ output/cv.pdf

# Clean up intermediate files
rm output/cv-content.typ output/cv.typ

# DOCX (Word format)
echo "  → DOCX"
pandoc cv.md -o output/cv.docx

# HTML (with custom CSS embedded)
echo "  → HTML"
pandoc cv.md -o output/cv.html \
  --standalone \
  --css=templates/cv.css \
  --embed-resources

echo "Done! Files in output/"
ls -lh output/
