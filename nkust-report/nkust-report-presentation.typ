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

== Language name

#text(size: 30pt)[
  - National Language Development Report recommended formal name:\
    "Taiwanese Taigi" or "Taigi"
  - ISO 639-3 etc. classifies as nan_TW, formal name: "Min Nan Chinese"
  - Can't fight that apart from CR 2021-044
  - → "Taiwanese Taigi" / "Taigi" if possible,\
    otherwise "Min Nan Chinese"
]

#pagebreak()

== aside: ISO 639-3 Change Request 2021-044

#text(size: 28pt)[
  - Split Taigi out from Min Nan Chinese (`nan`) and give it `ftg`
  - Would officially call Taigi "Taigi"
  - Submitted by Ìthuân Khoki (意傳科技) in 2021
  - Still pending as of 2026-06-04
  - Fingers crossed?
]

#pagebreak()

== Language code

- → `nan_TW` for now
- Hopefully CR 2021-044 will get accepted?\
  If so we'd get to use `ftg`

#pagebreak()

== Writing system

- "No standard writing system"?
- Pe̍h-ōe-jī was de facto standard (Taiwan Church News wrote in all-POJ in 1885\~1969)
- Tâi-lô + standard Han characters is already standard
- Choose two:\
  Mixed: Tāi-lô + standard Han characters for Taigi\
  All-romanized: all Tāi-lô

#pagebreak()

== Writing: mixed, all-Han, or all-Roman

- Tsuân-hàn (all Han characters) is infeasible (even nominally all-Han MOE dictionary has mixed script @kiantiong20230908 (eg. oo-tóo-bái))
- Tsuân-lô (all romanized): decades of publishing
- Hàn-lô (mixed script): decades of publishing
- → Both *mixed script* and *all romanized*

#pagebreak()

== Writing system: POJ or TL

- Tāi-lô (MOE's version of POJ) is MOE's standard
- "It's a transcription scheme" kind of, unfortunate naming
- Really a minor spelling reform over POJ (be more like IPA, support more Taigi dialects)
- No conflict between both (p is always p, 1-to-1 differences)

#pagebreak()

== Glibc locale

- Provides name, datetime format, numeric format, etc. metadata
- `nan_TW` locale already available since 2013 @glibc-nan_TW
- `nan_TW@latin` locale already available since 2009 @glibc-nan_TW_latin

#pagebreak()

#titleslide[
  = Translation process
]

#pagebreak()

== TODO KDE translation process
== TODO Creating a new language team
== TODO Translating: using Lokalize
== TODO Translating: setting up workspace
== TODO Translating in Lokalize

#pagebreak()

#titleslide[
  = TODO Results
]

#pagebreak()

== TODO describe

#pagebreak()

#titleslide[
  = TODO Discussion
]

#pagebreak()

== Bibliography
#set text(size: 16pt)
#bibliography("bibliography.bib", style: "apa", title: none)

// Local Variables:
// typst-preview--master-file: "nkust-report-presentation.typ"
// End:
