#import "@preview/polylux:0.4.0": *

#set page(paper: "presentation-16-9")
// #set page(numbering: "1")
// #set page(footer: context [
//   #set align(right)
//   #counter(page).display("1")
// ])
#set figure(supplement: none)
#set text(size: 32pt)
#set text(font: "Equity A")
// https://zenn.dev/mkpoli/articles/6234c1d2a595bd
// 漢字かなカナのみ指定（ゴシック体＝サンセリフ体）
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(
  font: "Noto Serif CJK TC",
)

#set cite(form: "full")
#show cite: it => {
  footnote(text(size: 20pt)[#it])
}
#set page(fill: rgb("#F7F4FA"))
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

#show heading: it => [
  #pagebreak()
  #it
]

#titleslide[
  = Introduction
]

== Who am I

- Shen Yu-hsiang / Kisaragi Hiu
- Main work: 2022\~ on zh_TW KDE translations

== What: KDE

#text(size: 30pt)[
  - KDE Plasma: major Linux desktop UI (other is GNOME)
    - Steam Deck desktop mode
  - KDE: a free software community w/ common infra & tech stack (Qt)
  - Other KDE apps: Dolphin, Krita, Calligra, Okular
  - Unified translation infrastructure
]

#figure(
  image("20260618T220925+0900.png"),
  caption: [KDE Plasma],
)

== What: Taiwanese Taigi

- aka Taiwanese
- ^ Could confuse as canonical language of Taiwan
- aka Taiwanese Hokkien
- ^ Many prefer its identity recognized
- ➝ National Language Development Report (MOC, 2022) compromise: emphasize Taigi is not the only language of Taiwan

== Why

- No Taigi user interface translations available
- Provide options for those who prefer
- I already contribute zh_TW translations to KDE, probably able to help

== What work

- Start translating KDE software into Taiwanese Taigi
- Infrastructure: modern tech terms
- Establish a language team
- Prerequisite before submitting upstream: `kcoreaddons`, `kio`, `kxmlgui`
  - Filetypes, licenses, some units; file IO and file management; common UI library

== Taigi software prior work

#text(size: 26pt)[
  - Pleroma translated by Tân Kiàn-ting in 2015 @kianting20150503
  - Mastodon also translated by Tân Kiàn-ting in 2025 @kianting20250604
  - Southern Min Wikipedia @wikipedia-zh-min-nan
]

#titleslide[
  = Foundational choices
]

== Language name

#text(size: 30pt)[
  - National Language Development Report:\
    "Taiwanese Taigi" or "Taigi"
  - ISO 639-3 etc.: "Min Nan Chinese"
  - Can't fight that apart from CR 2021-044 (still pending)
  - → "Taiwanese Taigi" / "Taigi" if possible,\
    otherwise "Min Nan Chinese"
]

== aside: ISO 639-3 Change Request 2021-044

#text(size: 28pt)[
  - Split Taigi out from Min Nan Chinese (`nan`) and give it `ftg`
  - Would officially call Taigi "Taigi"
  - Submitted by Ìthuân Khoki (意傳科技) in 2021
  - Still pending to this day
  - Fingers crossed?
]

== Language code

- → `nan_TW` for now
- Hopefully CR 2021-044 will get accepted?\
  If so we'd get to use `ftg`

== Writing system

- "No standard writing system"?

== Writing system

- Han characters, romanization (Tâi-lô or POJ),\
  Kana, Bopomofo, Hangul...
- Too many

== Writing system

- Han characters, romanization (Tâi-lô or POJ),\
  #strike[Kana], Bopomofo, Hangul...
  - Unused since 1945

== Writing system

- Han characters, romanization (Tâi-lô or POJ),\
  #strike[Kana], #strike[Bopomofo], Hangul...
  - Transcription scheme, not used as primary orthography

== Writing system

- Han characters, romanization (Tâi-lô or POJ),\
  #strike[Kana], #strike[Bopomofo], #strike[Hangul]...
  - Not seen it ever (no idea why English Wikipedia lists it)

== Writing system: POJ or TL

- Tâi-lô is an OK spelling reform\
  (ch → ts; oe/oa → ue/ua; eng → ing; tones sometimes on different vowels)
- Perfectly usable as primary orthography
- Clear standard
- No conflict (p is always p, 1-to-1 differences)
- → Use Tâi-lô

== Writing system

- Han characters, romanization (Tâi-lô #strike[or POJ]),\
  #strike[Kana], #strike[Bopomofo], #strike[Hangul]...
- Really just 3 valid standard options
- Standards: MOE dictionary, POJ Bible and conventions, 57-page Tâi-lô definitive manual @tailo-manual

== Mixed writing

- Choose 2: like Serbian, Uzbek, Mandarin...
- all-Han: inconvenient\
  (even MOE dictionary has eg. oo-tóo-bái @kiantiong20230908)
- all romanized (tsuân-lô): decades of publishing
- mixed script (hàn-lô): decades of publishing
- → Both *mixed script* and *all romanized*

== Glibc locale

#[
  #set text(size: 28pt)
  - Locale: name, datetime format, numeric format, etc.
  - `nan_TW` (all-Han or mixed) locale already available since 2013 @glibc-nan_TW
  - `nan_TW@latin` (all-romanized) locale already available since 2009 @glibc-nan_TW_latin
]

#titleslide[
  = Translation process
]

== KDE translation process

- GNU Gettext norms
- Source code → extract to template → translate → incorporate translation into source code
- KDE Invent repositories → KDE Subversion repository → Translate & commit → KDE Invent repositories, automated by Scripty

== Creating a new language team

- Metadata, send email to kde-l10n-doc mailing list announcing it, discuss, translate `kcoreaddons`, `kio`, `kxmlgui`, send if accepted
- Compromise on language name was made here

== Translating

- Using Lokalize (local CAT application, itself a KDE application)
- Set up workspace so strings are synced
- `nan_TW@latin` first to make sure using Taigi words, then write again in `nan_TW`

#figure(
  image("20260604T053624+0900-lokalize-project-overview.png"),
  caption: [Project overview],
)

#figure(
  image("20260604T053057+0900-lokalize-translate-nan_TW@latin.png"),
  caption: [Translating strings in a file],
)
#figure(
  image("20260604T053115+0900-lokalize-glossary.png"),
  caption: [Glossary management],
)

== Word choices

- experience: 5% the essence, 95% the discourse
- Use existing if possible (dictionaries, PTS Taigi TV's Taigi Words, search in ChhoeTaigi or Kemdict)
  - Kemdict: my own dictionary search frontend, slightly different, need both it and ChhoeTaigi
- Borrow: directly from English, directly from another source language, orthographically from Mandarin...

== Word choices: examples

#[
  #set text(size: 28pt)
  - Email: 電子批信 (seen in ChhoeTaigi's interface)
  - Catalonian: Catalunya-gí
  - Desktop environment: Toh-bīn-khuân-kíng (桌面環境)\
    Calqued from Mandarin / also orthographic borrowing
  - Open Containing Folder: 拍開*保存*資料鋏仔\
    Japanese 保存フォルダを開く\ (lit. Open the folder where [the file] is saved)
]

#titleslide[
  = Results
]

== Results

#[
  #set text(size: 24pt)
  - As of sending: base modules `kcoreaddons`, `kio`, `kxmlgui` + helpful `kconfig`, `kconfigwidgets`:\
    - `nan_TW@latin` 79% words (10828/13639), 92% strings (2147/2330)
    - `nan_TW` 65% words (8975/13639), 83% strings (1947/2330)
  - June 15, 2026: Team created! (Thank you aacid)\
    #[
      #set text(size: 24pt)
      https://l10n.kde.org/team-infos.php?teamcode=nan_TW\
      https://l10n.kde.org/team-infos.php?teamcode=nan_TW@latin
    ]
  - Staging repo:\
    #[
      #set text(size: 24pt)
      https://github.com/kisaragi-hiu/kde-l10n-nan_tw
    ]
]

#[
  #set image(width: 70%)
  #figure(
    grid(
      columns: 2,
      image("20260608T133631+0900.png"), image("20260608T133919+0900.png"),
    ),
    caption: text(
      size: 28pt,
    )[`nan_TW@latin` in Okular, `nan_TW` translations in Gwenview],
  )
]

#titleslide[
  = Discussion
]

== Future work & challenges

- More translation work, challenging (esp. with lack of manpower) but feasible
- Website, better/more collaboration spaces, word choice overview web page
- Lokalize work (multiple reference languages, glossary bugfix)

== Declarations

- zh_TW translator for the last 5 years, KDE e.V. voting member for this
- AI use: occasional chatbot use, pretranslation for a list of languages, grammar review for the report

== Bibliography
#set text(size: 16pt)
#bibliography("bibliography.bib", style: "apa", title: none)

// Local Variables:
// typst-preview--master-file: "coscup-presentation.typ"
// End:
