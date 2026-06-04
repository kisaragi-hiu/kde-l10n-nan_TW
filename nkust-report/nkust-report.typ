#set heading(numbering: "1.1.")
#set document(
  title: [Translating KDE Software Into Taiwanese Taigi],
  keywords: ("translation", "Taiwanese", "Taigi", "Min Nan Chinese"),
  author: "Shen Yu-hsiang",
)
#set page(numbering: "i")

// Editing this file: use typst-ts-mode, then use typst-preview-mode for real time preview
// Throw links/articles that you may want to reference into bibliography.bib

// This probably still needs at least 5 hours of work. Probably 10.

#align(center)[
  #title()
]

#let orcid(id) = {
  [ORCID: #link("https://orcid.org/" + id)[#id]]
}

#grid(
  columns: (1fr, 1fr),
  align(left)[Student: Shen Yu-hsiang\
    #link("mailto:mail@kisaragi-hiu.com")\
    #orcid("0000-0002-0293-7943")
  ],
  align(right)[Advisor: Dr. Wu Yi-ping\
    #link("mailto:yipingwu@nkust.edu.tw")
  ],
)

Report for independent study project (practical work)\
Department of English, National Kaohsiung University of Science and Technology\
2026/06/04\
Kaohsiung, Taiwan

#heading(numbering: none)[Abstract]

This report documents the work done with the goal of creating a Taiwanese Taigi translation team for the KDE project. A brief description of the context and challenges is included, as well as a discussion of the results.

_*Keywords*: #context (document.keywords.join(", "))_

#pagebreak()
#heading(numbering: none)[Table of Contents]
#outline(title: none)

#pagebreak()
#heading(numbering: none)[Figures]
#outline(title: none, target: figure.where(kind: image))

#set page(numbering: "1")
#counter(page).update(1)

= Introduction

I wish KDE software can be translated into Taiwanese (Taigi) so that users have an option to use the language if they wish to. This would then hopefully help more people to be exposed to the language, thus allowing the language to stay alive.

== What is Taiwanese Taigi

Taiwanese (Taigi) is one of several national languages of Taiwan (ROC). It is a Hokkien language, and is mutually intelligible with Amoy Hokkien, though it has its own ethnolinguistic identity @CR2021045-support. The language is facing an inheritance crisis: while 92.1% of Taiwanese people in their 50s can understand the language, only 38.9% of those in their teens understand it @MOC20250616. There is thus a revitalization effort to keep the language alive, such as the National Languages Development Plan @MOC20240708.

The language name is a subject of much debate. Its endonym is primarily Tâi-gí (Taiwan-language, corresponds to "Taiwanese" in English), but this is criticized, as Taigi itself is a language relatively recently introduced to the region now known as Taiwan during Qing rule. It is alternatively referred to as Bân-lâm-gí (Minnan-language, corresponds to "Min Nan" or "Hokkien" in English), but this is criticized, as Bân (閩) is seen as having negative connotations. This entire debate is succinctly summarized by the National Language Development Report from the #cite(<MOC20250616>, form: "prose", supplement: "p. 57"), in which the conclusion is that:

- Colloquially, the name is freely chosen by every speaker, and the report does not dictate which name is more appropriate. The report does, however, document names that are often used: 台語, 臺語, 臺灣話, 河洛話, 福佬話, 學佬話, 閩南語, 臺灣閩南語, and 臺灣台語. #cite(<MOC20250616>, supplement: "p. 65")
- In official contexts, the report chooses 臺灣台語 (Taiwanese Taigi). While this name specifies Taiwan twice, the intent of this is to emphasize that Taigi is not the only language of Taiwan, nor does it refer to all languages of Taiwan #cite(<MOC20250616>, supplement: "p. 68").

This article will stick to the National Language Development Report's recommendation for the official name ("Taiwanese Taigi" or "Taigi"), as adding to this debate is not what I would like to focus on.

== What is KDE

KDE is an international community that develops several suites of software programs and makes them available as Free Software @KDE. KDE projects include the Plasma desktop environment @KDEPlasma, available for Linux and other Unix-like operating systems and shipped on hardware devices such as Valve's Steam Deck @SteamDeckSpecs; an entire suite of applications supporting KDE Plasma such as the Dolphin file manager and the Gwenview image viewer; other applications like Krita, a digital painting application @Krita, or Kdenlive, a video editing application; as well as a number of miscellaneous projects and supporting software libraries.

KDE software constitutes a large part of a computing experience. Translating KDE's base libraries into a language requires establishing a large number of conventions for translating computing jargon, which is another step to Taigi revitalization that I would like to contribute towards.

== Prior work in Taigi localized software

There are a few existing Taigi software translation projects, or software (or websites) that are written in Taigi, that I know of:

- Tân Kiàn-ting wrote about translating the free software social media Pleroma into Taiwanese Taigi in 2015 @kianting20150503. He also mention having worked on translating parts of the Caja file manager for Linux.
- Kiàn-ting also translated the (more widely used) social media Mastodon into Taiwanese Taigi in 2025 @kianting20250604. The translation is initially merged into Mastodon in February 2026 and he presumably continues to maintain it.
- The Hokkien Wikipedia, while specifically for Hokkien (Minnan), still serves as prior art of Taigi translation as the two languages are mutually intelligible.

= Foundational choices

Before translation can start, there are a few foundational questions that I had to answer. These are: what should I call this language? Which language code should I use for it? And which writing system should I use?

== Language name

*Final choice: _Taiwanese Taigi_ or _Taigi_ if possible, _Min Nan Chinese_ where I must*

Although the National Language Development Report @MOC20250616 has settled this question in Taiwan ("Taiwanese Taigi" or "Taigi" in English, "臺灣台語" in Mandarin), this is not the established norm outside of Taiwan.

Right now, Taiwanese Taigi is regarded as a "variety" of Hokkien (Taiwanese Hokkien), and in international standards is referred to as a "variety" of "Min Nan Chinese", an English name that is transcribed through a Mandarin name of the language.

This situation is not ideal in regards to the principle of respecting the endonym of a language's own speakers, but I am one person and do not want to wait until international standards catch up in respecting this principle before I start the actual work of translating. Therefore, my choice here is to use the official name or the colloquial name if I can ("Taiwanese Taigi", "Taigi", or "Taiwanese"); and to refer to the language as "Min Nan Chinese" if I have to.

There is hope, however: a ISO 639-3 Change Request that establishes Taigi as its own language with its own language code, Change Request 2021-044 @iso639-3-CR2021-044, is currently pending consideration. If this does get adopted, then the official language name will be more likely to be respected.

== Language code

*Final choice: _nan_TW_ for now*

Adjacent to the choice of the name of the language, software translations (including KDE) also requires choosing a short name for the language or regional dialect. For example, British English is `en_GB`, and Japanese is `ja`. The international standard for this is ISO 639, with the de-facto standard being a mix of ISO 639-3 (comprehensive three-letter codes) and ISO 639-1 (two-letter codes).

The choice here is obvious, as Taigi doesn't have its own code yet (pending the aforementioned Change Request 2021-044 @iso639-3-CR2021-044), the next best code is `nan` for Min Nan Chinese, with a region code of `TW` to denote Taiwanese Minnan, ie. Taiwanese Hokkien.

== Writing system
*Final choice: two systems, mixed script (hàn-lô) and all-romanized (tsuân-lô), both using Tāi-lô orthography*

Compared to the vast number of people who speak Hokkien natively, it is historically rarely written down. This is related to how traditional Chinese writing used to only write things in Literary Chinese. The same can be said for Taigi as well.

Taigi does have a large (in absolute terms) corpus of written material in a fairly standardized form, _Pe̍h-ōe-jī_ (literally "vernacular writing"), mostly written between the late 19th century and the mid 20th century.

Before I can translate anything, I have to decide on one (or two, as we'll see below) appropriate writing system. Taigi writing systems that have some actual use (and not just one dictionary writer's pet project) include:

- *Spelling Taiwanese Taigi words in an ad-hoc way using exclusively Han characters*. This has relatively widespread usage in older lyrics, but is usually disregarded as a legitimate writing system. Personally I regard this as a real writing system worthy of further research, as (contrary to popular belief) it is more regular than a completely ad-hoc system (for example, "guá" may be written as 哇 or 挖, characters pronounced as "wa" in Mandarin, but never as 蛙, another character with the same pronunciation in Mandarin). However, the fact that it is perceived as informal writing means it is clearly inappropriate for software UI translation.

- *Using Han characters exclusively but with an actually standardized set of characters*, also referred to as tsuân-hàn (全漢). Currently the regulator for which characters are correct is the Taiwan (ROC) Ministry of Education, but there is also a history of Taigi works in Han characters that don't depend on ad-hoc Mandarin pronunciations. Examples of the latter that I've seen include List Of Plants Of Formosa @sasaki1928 and 商用台語 @wu1994. Most Ministry of Education material is written in this style.

- *Using exclusively Latin characters*, or romanization (also referred to as 全羅). This is similar to the present Vietnamese writing system. There are two main systems for this: the aforementioned Pe̍h-ōe-jī, or the relatively new Tâi-lô. Pe̍h-ōe-jī was developed throughout the late 19th century by Christian missionaries, and is useful both as a transcription scheme for annotating Han characters as well as being used as a primary writing system. Taiwan's first newspaper, Tâi-oân-hú-siâⁿ Kàu-hōe-pò @tohskhp18850712 (Taiwan Prefecture City Church Newspaper, now called Taiwan Church News) was written in this style for the first several decades of its life.

- *Using a mix of Han characters and Latin characters*, also referred to as hàn-lô (漢羅). This is similar to Japanese mixed script: write each word in whichever script that suits it best. The Latin characters are written in either Pe̍h-ōe-jī or Tâi-lô, but writers who write in this style always use standardized Han characters.

This may look like an unthinkably large number of writing systems, but indeed this list can be simplified to two items considering a few facts.

- Using ad-hoc Han characters is ruled out as mentioned above.
- No one actually writes exclusively with Han characters. As noted by Tân Kiàn-tiong @kiantiong20230908, even the Ministry of Education occasionally writes in mixed script in its Taigi dictionary @kautian when encountering certain loanwords. Apart from loanwords, the fact that the third person possessive pronoun 𪜶 (/in/) is poorly supported by fonts also means in practice it remains more convenient to fall back to writing words in romanization even when there is a preference to write as much in Han characters as practical.
- While Pe̍h-ōe-jī and Tâi-lô are often treated as separate systems, in reality Tâi-lô is a minor spelling reform on top of Pe̍h-ōe-jī. The way tones are marked remains identical; the convention of separating syllables within one compound with "-" instead of spaces is the same too. The only difference is that some consonants and vowels are spelled differently, such as `ch` in Pe̍h-ōe-jī being spelled `ts` in Tâi-lô, or `oe` in Pe̍h-ōe-jī being spelled `ue` in Tâi-lô, but the differences are one-to-one and unambiguous.

This leaves us with two systems: *mixed script (hàn-lô)* and *exclusively romanization (tsuân-lô)*.

=== Pe̍h-ōe-jī or Tâi-lô?

There is still a question of whether I should use Pe̍h-ōe-jī or Tâi-lô. This question itself can get contentious, but I still need to make a choice and move on, as I consider them similar enough that it isn't worth the effort to support both (which would double the number of scripts to support from 2 to 4).

Ultimately I chose Tâi-lô because that's what the Ministry of Education, which I already refer to as an authority when deciding which Han characters are correct, has chosen on this topic. Since Pe̍h-ōe-jī and Tâi-lô are compatible with each other as Tâi-lô does not conflict with Pe̍h-ōe-jī characters @iunn2021, it would be totally fine if one day another translator joins the project and decides to prefer Pe̍h-ōe-jī: mixed Tâi-lô and Pe̍h-ōe-jī might be inconsistent but would not be ambiguous. Moreover, software for automatically converting between the two already exist @ithuan-kesi, so if this choice ever needs to be revisited it will be trivial to switch.

== Glibc locale

Glibc (the GNU C Library) provides core libraries for many Linux systems @glibc, and includes a system of "locales", which define the name, date/time format, numeric format, territory, etc. of a given language variant.

A decision on this has already been made before me, in fact. A `nan_TW` locale has been available since 2013 @glibc-nan_TW, and a `nan_TW@latin` locale has been available since 2009 @glibc-nan_TW_latin. To quote the submittion of `nan_TW@latin`:

#quote(block: true, attribution: [Arne Goetje])[
  Minnan can be written using Latin or traditional Han script. Therefor this locale has \@latin to clarify which script we use.
]

= Process

== KDE translation process

For some background, the normal KDE translation process @kde-translation-howto can be summarized like this:

1. Development and extraction: Developers write software with user-facing strings clearly marked for translation; the xgettext program from GNU gettext @gnu-gettext is used to extract these strings into "PO Template" files; then the msgmerge program from GNU gettext is used to merge the newly extracted template with the current translations, as "PO" files, if they exist. These translation files are stored in the KDE Subversion repository @websvn-kde.

2. Translate: Translators then take existing PO files from the Subversion repository, translate them, then submit them. Some translators have direct commit access to the Subversion repository, so they can, after responsibly reviewing their submission, directly push translations into the repository; these translators are language coordinators of their translation teams. Other translators may send their translations to language coordinators, in whichever way each language coordinator or translation team sees fit. For example, the Simplified Chinese team gathers translations via their own Crowdin project, and their language coordinator periodically synchronizes the translations on their Crowdin project with the `zh_CN` translations in the KDE Subversion repository.

3. Push: The translated PO files are then pushed into the source repositories of KDE software, so that the next time they are built they will use the newly translated strings.

The process to extract strings from source repositories, merge them with existing translations, then push existing translations back into source repositories is automated by a _localization and internationalization service bot_ that runs daily called Scripty @scripty.

== Requirements for creating a language team

Creating a new language team for KDE roughly requires providing the developers the information needed for it, as well as some initial translations for some KDE components. In particular, the modules `kcoreaddons`, `kio`, and `kxmlgui` need to be translated first @kde-translation-howto-starting.

A compromise also had to be made for the language name: although Taiwanese Taigi is now the officially recommended formal name of this language, this has not been recognized by international standards such as ISO 639-3, or by systems that treat Taiwanese Hokkien as a regional variant of Min Nan Chinese and does not allow a regional variant to have a separate name, as seems to be the case for glibc locales. Thus, for the time being, until if and when ISO 639-3 CR 2021-044 @iso639-3-CR2021-044 (establish Taigi as its own language with code `ftg`) is accepted, this language would have to be added with `nan_TW` as the language code and "Min Nan Chinese" as the English name.

== Translating for Taiwanese Taigi

As a Taiwanese Taigi language team does not already exist, I have to merge translation templates with my translations with my own automation. I also have to set up a translation "workspace" myself to most effectively utilize the capabilities of the Lokalize computer-aided translation system (also itself a KDE application) @lokalize.

Lokalize provides translation memory (suggestions for translation from other similar source text entries), glossary management, seeing other languages for reference, and tracking translation progress across a whole tree of translation files, all for an offline folder of PO files without requiring a server while translating, without which this translation process would've likely been far more tedious.

=== Setting up translation workspace

My translation folder, which I've come to refer to as my translation "workspace", is set up like this:

- *\~/kde-translations/l10n-templates*: a clone of the templates repository @kde-l10n-templates, which has been migrated off Subversion and is now tracked in a Git repository.
- *\~/kde-translations/kde-svn*: a partial checkout of the Subversion repository, utilizing the `svn update --set-depth <depth>` feature @svn-redbook-depth to avoid downloading the entire repository's head revision. I set it up such that the partial checkout has this directory structure:
  - kde-svn/trunk/
    - l10n-kf5
      - ja
      - zh_TW
    - l10n-kf6
      - ja
      - zh_TW
- *\~/kde-translations/zh_TW*: a Lokalize project directory for Traditional Chinese, using symbolic links to make Lokalize see files from `~/kde-translations/kde-svn` in one project. This is useful for my work as a KDE translator for Traditional Chinese, but for Taiwanese Taigi this is here for reference. It has this directory structure:
  - zh_TW
    - kf5: symbolic link to ../kde-svn/trunk/l10n-kf5/zh_TW
    - kf6: symbolic link to ../kde-svn/trunk/l10n-kf6/zh_TW
    - index.lokalize: the Lokalize project declaration file, created using Lokalize's Create Project functionality
- *\~/kde-translations/ja*: a directory for Japanese with the same directory structure as \~/kde-translations/zh_TW. Since I don't translate for Japanese, this is not initialized as a Lokalize project, but merely with files in the same directory structure so that Lokalize can find them and show them as Alternative Translations.
  - ja
    - kf5: symbolic link to ../kde-svn/trunk/l10n-kf5/ja
    - kf6: symbolic link to ../kde-svn/trunk/l10n-kf6/ja
- *\~/kde-translations/templates*: a directory with two symlinks to the templates repository, to make Lokalize see these templates the same directory structure.
  - templates
    - kf5: symbolic link to ../l10n-templates/trunk5
    - kf6: symbolic link to ../l10n-templates/trunk6
- *\~/kde-translations/l10n-nan_TW-repo*: a Git repository for storing my current Taiwanese Taigi translated result. This has to be a separate folder and symlinked, like the setup with kde-svn and ja/zh_TW folders, because I want to keep both `nan_TW` and `nan_TW@latin` translations in the same Git repository.
  - l10n-nan_TW-repo
    - nan_TW
      - kf5: does not exist (yet) because this initial translation does not require any project corresponding to this folder
      - kf6: newly translated PO files
      - index.lokalize: the Lokalize project declaration file
    - nan_TW\@latin
      - kf5: does not exist (yet) for the same reason
      - kf6: newly translated PO files
      - index.lokalize: the Lokalize project declaration file
- *\~/kde-translations/nan_TW* and *\~/kde-translations/nan_TW\@latin*: symlinks to l10n-nan_TW-repo/nan_TW and l10n-nan_TW-repo/nan_TW\@latin, respectively.

This directory structure allows me to utilize Lokalize to the fullest extent.

=== Translating in Lokalize

#figure(
  image("20260604T053624+0900-lokalize-project-overview.png"),
  caption: [Lokalize project overview],
) <img-overview>
#figure(
  image("20260604T053022+0900-lokalize-translate-nan_TW.png"),
  caption: [Translating a nan_TW (Hàn-lô) string in Lokalize.],
) <img-nan_TW>

#figure(
  image("20260604T053057+0900-lokalize-translate-nan_TW@latin.png"),
  caption: [Translating a nan_TW\@latin (Tsuân-lô) string in Lokalize.],
) <img-nan_TW-latin>

#figure(
  image("20260604T053115+0900-lokalize-glossary.png"),
  caption: [The glossary view in Lokalize.],
) <img-glossary>

In @img-overview, the project overview is showing translation progress for each file. Files that exist in templates but don't exist in this translation project are nevertheless shown as 0% translated files, instead of being omitted.

In @img-nan_TW, the project is set up to use the nan_TW\@latin project as its source of alternate translations, so the translation of the corresponding entry shows up in the Alternate Translations widget.

In @img-nan_TW-latin, I have set Japanese as the source of alternate translations for nan_TW\@latin, so Alternate Translations shows a Japanese translation of this string. The Translation Memory widget shows suggested translations that have similar source language strings.

Finally, in @img-glossary, the interface shows the glossary entries which I have created to help maintain some level of consistency as I translate.

=== Word choices

As I translate, I may need to look up how to say a phrase or word in Taigi, in which case I may look it up on ChhoeTaigi #footnote[unified search interface for several Taigi sources and dictionaries. @chhoetaigi], Lohankha loanword transliteration system @lohankha-loanword, or my own Kemdict #footnote[unified search interface for many dictionaries for Taigi, Mandarin, and Hakka, including some Taigi sources not included by ChhoeTaigi, as well as providing fuzzy Taigi search that allows omitting tone marks. @kemdict]. Kemdict in particular allows me to search the Taiwan Public Television Service's Taigi TV New Words Dictionary (台語新詞辭庫) @pts-taigitv-new-words together with other dictionaries, which is why I rely on it just as much as on ChhoeTaigi.

I also try to refer to prior art where it exists. For software translation I have not found much reference, except for Tân Kiàn-ting's Mastodon translation @kianting20250604 which is immensely helpful where the same concepts have been mentioned.

When I cannot find what a concept should directly correspond with, I fall back to borrowing from English, or orthographically borrowing the word from Mandarin (such as using si̍t-thé to correspond to _entity_ or _instance_).

= Result

// TODO: expand

There may still be more work to do other than the translation itself, such as there being a requirement that a QLocale entry be created. More work will be needed in this regard, perhaps with the guidance of other KDE developers.

While the documented base modules are `kcoreaddons`, `kio`, and `kxmlgui`, I found that two other modules `kconfig` and `kconfigwidgets` seem just as helpful to translate when building a foundation for the overall translation. As of 2026-06-04, these 5 modules are currently 78% translated overall, with `nan_TW@latin` being 87% translated and `nan_TW` being 69% translated, according to statistics collected with pocount from Translate Toolkit @pocount.

These translations are currently available on GitHub:\
https://github.com/kisaragi-hiu/kde-l10n-nan_tw

= TODO Discussion

It would be a shame if Taiwanese Taigi as a language were lost as less and less people speak it

= Declarations
== AI usage

- I have occasionally asked a chatbot for a second opinion on the translation of specific words. The results are always judged by my knowledge of the language (I only use them as a reminder), and I have been trying this less and less, as I found this to rarely be as passably correct than simply borrowing from another language.
- There are 106 strings in `kconfigwidgets._desktop_.po`, which are all language names. Through my own search I've filled 44 of them already. The rest seems like I would have to copy from Hokkien Wikipedia.

  I tried using Gemini CLI for this task once, using gemini-3-flash-preview with this prompt: #quote(block: true)[./words.po is a Gettext PO file that contains a list of languages in English. Please fill in their translations in Taiwanese Hokkien#footnote[I would prefer "Taigi", but figured the model would understand "Taiwanese Hokkien" better.]. Use your search tool if available.]

  I then reviewed the result and incorporated them as appropriate. Almost all strings turned out to need further tweaking by me looking them up on Hokkien Wikipedia again myself. This helped in only three minor ways:

  - By having 62 filled-in but slightly wrong strings, this motivated me to go through each of them and figure out something better, instead of being intimidated by 62 empty strings.
  - I learned that Crimea is better borrowed into Taigi directly from Ukrainian, such that Crimean Tatar is _Krym Tatar-gí_
  - I realized that I could translate Latin (script) into "Lô-má-jī" (literally "Rome characters") instead of the clumsy "La-ting bûn-jī".

== Potential conflict of interest

I am already a KDE translator for Traditional Chinese (Taiwanese Mandarin), and have been for the last 5 years. I am a KDE e.V. voting member because of this work.

#pagebreak()
#heading(numbering: none)[Acknowledgements]

This work is built on the shoulder of many giants.

On the software side, I would like to thank Lokalize developers for making such a crutial piece of my workflow (especially Finley Watson for reviewing my occasional Merge Requests); as well as Typst, for being a fast and easy alternative to LaTeX, with as much flexibility as the Lisp-based documentation systems that I've used in the past while having a lot more batteries included. The table of contents is a one-liner and required barely any bookkeeping, allowing me to focus on translating and writing this report.

On the Taigi side, I would like to thank Arne Goetje @glibc-nan_TW_latin and Wei-Lun Chao @glibc-nan_TW for contributing Taigi locales (as Min Nan Chinese) into glibc ages ago, in 2009 and 2013, respectively; Ìthuân Khoki, for submitting ISO 639-3 CR 2021-044 @iso639-3-CR2021-044; Dr. Iûⁿ Ún-giân, ChhoeTaigi and the Tâi-bûn Ke-si Mī project, and countless others for all the work on Taigi revitalization; and all those who made the dictionaries that I've been relying on, especially the Ministry of Education's Dictionary of Frequently-Used Taiwanese Taigi @kautian, the Maryknoll Taiwanese-English Dictionary @maryknoll1976, the Comprehensive Taiwanese-Japanese Dictionary by 小川尚義 @taijit and its Taigi translation by Elder Lîm Chùn-io̍k @taijit-taigi, as well as the Taiwan Public Television Service's Taigi TV New Words Dictionary (台語新詞辭庫) @pts-taigitv-new-words.

// TODO Lastly, on a more personal note...

#bibliography("bibliography.bib", style: "ieee")

// Local Variables:
// typst-preview--master-file: "/home/kisaragi-hiu/kde-translations/l10n-nan_TW-repo/nkust-report/nkust-report.typ"
// citar-bibliography: ("bibliography.bib")
// End:
