#import "@preview/polylux:0.4.0": *

#set page(paper: "presentation-16-9")
#set page(numbering: "1")
#set text(size: 32pt)

#set cite(form: "full")
#show cite: it => {
  footnote(text(size: 20pt)[#it])
}
#set page(fill: rgb("#F7F4FA"))
#set page(footer: context [
  #set align(right)
  #counter(page).display("1")
])
#let titleslide(content) = [
  #slide[
    // #set page(fill: black)
    #set page(fill: rgb("#171518"))
    #set text(fill: white)
    #align(horizon)[
      #content
    ]
  ]
]

#align(horizon)[
  \
  = Translating KDE Software Into Taiwanese Taigi
  Shen Yu-hsiang (C107133201)\
  Advisor: Dr. Wu Yi-ping\
  #text(size: 24pt)[Academic year 114-2, June 2026]
]

#pagebreak()

#titleslide[
  = Introduction
]

#pagebreak()

== Who am I

- Shen Yu-hsiang
- Kisaragi Hiu
- Main work: 2022\~now working on zh_TW KDE translations

#pagebreak()

== Why

- No Taiwanese Taigi user interface translations available
- I already contribute zh_TW translations to KDE
- I can help? Probably?

#pagebreak()

== What

- "Taiwanese Taigi"?
- What is KDE anyways
- What work

#pagebreak()

== What: Taiwanese Taigi

- Mutually intelligible with Hokkien; also known as Taiwanese Hokkien
- Ususally "Taiwanese" in English but could confuse as the one canonical language of Taiwan
- National Language Development Report (MOC) compromise: emphasize Taigi is not the only language of Taiwan

#pagebreak()

== What: KDE

#text(size: 30pt)[
  - Was "K Desktop Environment", FOSS computing environment for Linux and other OSs
  - Now a Free Software community / forge / common infrastructure
  - KDE software: KDE Plasma (DE, used by Steam Deck et al), day-to-day apps, professional apps, software libraries
  - Unified translation infrastructure
]

#pagebreak()

== What work

- Start translating KDE software into Taiwanese Taigi
- Establish a language team
- Initial work done → then easy revision / improvement

#pagebreak()

== Taigi software prior work

#text(size: 28pt)[
  - Pleroma translated by Tân Kiàn-ting in 2015 @kianting20150503
  - Mastodon also translated by Tân Kiàn-ting in 2025 @kianting20250604
  - Southern Min Wikipedia @wikipedia-zh-min-nan
]

#pagebreak()

#titleslide[
  = Foundational choices
]

#pagebreak()

== TODO a
== TODO b
== TODO c
== TODO d
== TODO e

#pagebreak()

#titleslide[
  = Translation process
]

#pagebreak()

== TODO a
== TODO b
== TODO c
== TODO d
== TODO e

#pagebreak()

#titleslide[
  = Results
]

#pagebreak()

#titleslide[
  = Discussion
]

#pagebreak()

== Bibliography
#set text(size: 16pt)
#bibliography("bibliography.bib", style: "apa", title: none)

// Local Variables:
// typst-preview--master-file: "/home/kisaragi-hiu/kde-translations/l10n-nan_TW-repo/nkust-report/nkust-report-presentation.typ"
// End:
