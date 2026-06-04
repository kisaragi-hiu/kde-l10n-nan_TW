#import "@preview/polylux:0.4.0": *

#set page(paper: "presentation-16-9")
#set text(size: 32pt)

#set cite(form: "full")
#show cite: it => {
  footnote(text(size: 20pt)[#it])
}

#align(horizon)[
  \
  = Translating KDE Software Into Taiwanese Taigi
  Shen Yu-hsiang (C107133201)\
  Advisor: Dr. Wu Yi-ping\
  #text(size: 24pt)[Academic year 114-2, June 2026]
]

#pagebreak()

#align(horizon)[
  = Introduction
]

#pagebreak()

= Who am I

- Shen Yu-hsiang
- Kisaragi Hiu
- Main work: 2022\~now working on zh_TW KDE translations

#pagebreak()

= Why

- No Taiwanese Taigi user interface translations available
- I already contribute zh_TW translations to KDE
- Help keep the language alive

#pagebreak()

= What

- "Taiwanese Taigi"?
- What is KDE anyways
- What work

#pagebreak()

= What: Taiwanese Taigi

- Mutually intelligible with Hokkien; also known as Taiwanese Hokkien
- Ususally "Taiwanese" in English but could confuse as the one canonical language of Taiwan
- National Language Development Report (MOC) compromise: emphasize Taigi is not the only language of Taiwan

#pagebreak()

= What: KDE

#text(size: 30pt)[
  - Was "K Desktop Environment", FOSS computing environment for Linux and other OSs
  - Now a Free Software community / forge / common infrastructure
  - KDE software: KDE Plasma (DE, used by Steam Deck et al), day-to-day apps, professional apps, software libraries
  - Unified translation infrastructure
]

#pagebreak()

= What work

- Start translating KDE software into Taiwanese Taigi
- Establish a language team
- Initial work done → then easy revision / improvement

#pagebreak()

= Taigi software prior work

#text(size: 28pt)[
  - Pleroma translated by Tân Kiàn-ting in 2015 @kianting20150503
  - Mastodon also translated by Tân Kiàn-ting in 2025 @kianting20250604
  - Southern Min Wikipedia @wikipedia-zh-min-nan
]

#pagebreak()

#align(horizon)[
  = Foundational choices
]

#pagebreak()

#align(horizon)[
  = Translation process
]

#pagebreak()

#align(horizon)[
  = Results
]

#pagebreak()

#align(horizon)[
  = Discussion
]

#pagebreak()

#bibliography("bibliography.bib", style: "apa")

// Local Variables:
// typst-preview--master-file: "/home/kisaragi-hiu/kde-translations/l10n-nan_TW-repo/nkust-report/nkust-report-presentation.typ"
// End:
