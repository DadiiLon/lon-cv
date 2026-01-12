// Modern CV Typst Template
#let accent = rgb("#2563eb")
#let text-light = rgb("#6b7280")

#set document(title: "CV")
#set page(
  paper: "a4",
  margin: (x: 54pt, y: 52pt),
)

#set text(
  font: "Noto Sans",
  size: 10.5pt,
  fill: rgb("#1f2937"),
)

#set par(
  leading: 0.7em,
  justify: false,
)

// Heading styles
#show heading.where(level: 1): it => {
  set text(size: 24pt, weight: "bold")
  it
  v(-4pt)
}

#show heading.where(level: 2): it => {
  v(14pt)
  set text(size: 10pt, weight: "semibold", fill: accent)
  upper(it)
  v(-8pt)
  line(length: 100%, stroke: 1.5pt + accent)
  v(6pt)
}

#show heading.where(level: 3): it => {
  v(8pt)
  set text(size: 10.5pt, weight: "semibold")
  it
  v(-2pt)
}

// Links
#show link: it => {
  set text(fill: accent)
  it
}

// Emphasis (dates)
#show emph: it => {
  set text(fill: text-light, size: 9.5pt)
  it
}

// Horizontal rules
#show line: it => {
  v(8pt)
  it
  v(8pt)
}

// Lists
#set list(
  indent: 12pt,
  marker: text(fill: accent)[•],
)

// Tables
#set table(
  stroke: none,
  inset: (x: 0pt, y: 6pt),
)

#show table.cell.where(y: 0): set text(weight: "semibold", fill: text-light)
