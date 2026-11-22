// Resume template — styled to match Joey's Jun-2026 resume (tight single-column,
// Times New Roman, all-caps ruled section headers, left-aligned bullets).
// Edit styling here; edit content in resume.typ (and per-application copies).
// Compile: typst compile resume.typ resume.pdf

#let rule-color = rgb("#000000")

// Render a single contact item, auto-linking emails, GitHub/LinkedIn, and
// websites. Phone numbers and plain locations render as-is.
#let contact-item(c) = {
  if c.contains("@") {
    link("mailto:" + c)[#c]
  } else if c.starts-with("http") {
    link(c)[#c.replace("https://", "").replace("http://", "")]
  } else if c.contains(".com") or c.contains(".dev") or c.contains(".io") or c.contains(".ca") or c.contains(".org") {
    link("https://" + c)[#c]
  } else {
    c
  }
}

#let resume(
  name: "",
  contacts: (),       // list of strings, joined with " | " (emails/URLs auto-link)
  body,
) = {
  set document(title: name + " — Resume", author: name)
  set page(
    paper: "us-letter",
    margin: (x: 1.45cm, top: 1.2cm, bottom: 1.0cm),
  )
  set text(font: "Times New Roman", size: 10.5pt, fill: black)
  set par(justify: false, leading: 0.5em, spacing: 0.5em)

  // Tight, hanging bullet lists
  set list(indent: 0pt, body-indent: 6pt, marker: [•], spacing: 0.5em)

  // Header
  align(center)[
    #text(size: 16pt, weight: "bold")[#name] \
    #v(1pt)
    #text(size: 10pt)[#contacts.filter(c => c != "").map(contact-item).join("  |  ")]
  ]
  v(3pt)

  body
}

// All-caps section heading with a full-width rule directly beneath it.
#let section(title) = {
  v(6.5pt)
  text(size: 11pt, weight: "bold", tracking: 0.06em)[#upper(title)]
  v(1.5pt)
  line(length: 100%, stroke: 0.6pt + rule-color)
  v(2.5pt)
}

// Two-row experience/education entry:
//   row 1: bold org (left) + bold location (right)
//   row 2: italic title (left) + italic date (right)
#let entry(
  org: "",
  location: "",
  title: "",
  date: "",
  bullets: (),
) = {
  block(width: 100%, breakable: false, above: 7pt, below: 2pt)[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      text(weight: "bold")[#org],
      text(weight: "bold")[#location],
    )
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      text(style: "italic")[#title],
      text(style: "italic")[#date],
    )
    #if bullets.len() > 0 [
      #v(1pt)
      #list(..bullets)
    ]
  ]
}

// Project heading: bold name + italic parenthetical stack, then bullets.
#let project(name, stack, bullets: ()) = {
  block(width: 100%, breakable: false, above: 5pt, below: 2pt)[
    #text(weight: "bold")[#name] #text(style: "italic")[ (#stack)]
    #if bullets.len() > 0 [
      #v(1pt)
      #list(..bullets)
    ]
  ]
}

// One-line skill / category row: bold label + content.
#let skill(label, content) = {
  block(width: 100%, above: 3pt, below: 3pt)[#text(weight: "bold")[#label: ] #content]
}
