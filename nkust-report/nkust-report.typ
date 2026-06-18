#set heading(numbering: "1.1.")
#show quote: set block(above: 0.75em)
#show quote: set block(below: 0.75em)
#show quote: set block(inset: (x: 0.5em))

#show heading.where(level: 1): set block(below: 1em)
#show heading.where(level: 1): set align(center)
// https://zenn.dev/mkpoli/articles/6234c1d2a595bd
// 漢字かなカナのみ指定（ゴシック体＝サンセリフ体）
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "Noto Serif CJK TC")
#set document(
  title: [Translating KDE Software Into Taiwanese Taigi],
  keywords: ("translation", "Taiwanese", "Taigi", "Min Nan Chinese"),
  author: "Shen Yu-hsiang",
)
#set page(numbering: "i")

#let footnoteCite(target, ..args) = {
    return footnote(cite(target, form: "full", ..args))
}

#let today = datetime(year: 2026, month: 6, day: 18)

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
#today.display("[month repr:long] [day], [year]")\
Kaohsiung, Taiwan

#heading(numbering: none)[Abstract]

Taiwanese Taigi (also known as Taiwanese, Taigi, or Taiwanese Hokkien) is a language in a process of being revitalized, to ensure its survival into the next generations. Similar to other Hokkien languages, Taigi has historically not been used in writing by most speakers. To bring written Taigi to this era and to provide options for people who already speak the language, it is necessary that user interfaces are translated into this language. As a stepping stone, I have embarked on an effort to provide Taigi translations for KDE projects.

This report documents the work done to this end. An introduction to KDE and Taiwanese Taigi is provided. Numerous foundational choices are identified and then decided on for this translation. For the language name, the language is called "Taiwanese Taigi", but there are some places that require "Min Nan Chinese" and that is acceptable for now; for the language code, nan_TW is the answer for now; for the writing system, two are chosen (similar to other multi-script languages), which are mixed script (Han characters + Latin script) and all-Latin script. I then describe my translation process, including how KDE translation generally works and what I do in my process to make it more effective.

Finally, I go through the current result and discuss challenges and where future work may be needed.

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

I wish KDE software could be translated into Taiwanese (Taigi) so that users have an option to use the language if they wish to. This would then hopefully help more people to be exposed to the language, thus allowing the language to stay alive.

I already contribute Traditional Chinese (Taiwanese Mandarin) translations to KDE.

== What is Taiwanese Taigi

Taiwanese (Taigi) is one of several national languages of Taiwan (ROC). It is a Hokkien language, and is mutually intelligible with Amoy Hokkien, though it has its own ethnolinguistic identity #footnoteCite(<CR2021045-support>). The language is facing an inheritance crisis: while 92.1% of Taiwanese people in their 50s can understand the language, only 38.9% of those in their teens understand it #footnoteCite(<MOC20250616>). There is thus a revitalization effort to keep the language alive, such as the National Languages Development Plan #footnoteCite(<MOC20240708>).

The language name is a subject of much debate. Its endonym is primarily Tâi-gí (Taiwan-language, corresponds to "Taiwanese" in English), but this is criticized, as Taigi itself is a language relatively recently introduced to the region now known as Taiwan during Qing rule. It is alternatively referred to as Bân-lâm-gí (Minnan-language, corresponds to "Min Nan" or "Hokkien" in English), but this is criticized, as Bân (閩) is seen as having negative connotations. This entire debate is succinctly summarized by the National Language Development Report from the #cite(<MOC20250616>, form: "prose", supplement: "p. 57"), in which the conclusion is that:

- Colloquially, the name is freely chosen by every speaker, and the report does not dictate which name is more appropriate. The report does, however, document names that are often used: "台語, 臺語, 臺灣話, 河洛話, 福佬話, 學佬話, 閩南語, 臺灣閩南語, 臺灣台語". #cite(<MOC20250616>, supplement: "p. 65")
- In official contexts, the report chooses 臺灣台語 (Taiwanese Taigi). While this name specifies Taiwan twice, the intent of this is to emphasize that Taigi is not the only language of Taiwan, nor does it refer to all languages of Taiwan #cite(<MOC20250616>, supplement: "p. 68").

This report will stick to the National Language Development Report's recommendation for the official name ("Taiwanese Taigi" or "Taigi"), as adding to this debate is not what I would like to focus on.

== What is KDE

KDE is an international community that develops several suites of software programs and makes them available as Free Software #footnoteCite(<KDE>). KDE projects include the Plasma desktop environment #footnoteCite(<KDEPlasma>), available for Linux and other Unix-like operating systems and shipped on hardware devices such as Valve's Steam Deck #footnoteCite(<SteamDeckSpecs>); an entire suite of applications supporting KDE Plasma such as the Dolphin file manager and the Gwenview image viewer; other applications like Krita, a digital painting application #footnoteCite(<Krita>), or Kdenlive, a video editing application; as well as a number of miscellaneous projects and supporting software libraries.

KDE software constitutes a large part of a computing experience. Translating KDE's base libraries into a language requires establishing a large number of conventions for translating computing jargon, which is another step to Taigi revitalization that I would like to contribute towards.

== Prior work in Taigi localized software

There are a few existing Taigi software translation projects, or software (or websites) that are written in Taigi, that I know of:

- Tân Kiàn-ting wrote about translating the free software social media Pleroma into Taiwanese Taigi in 2015 #footnoteCite(<kianting20150503>). He also mentioned having worked on translating parts of the Caja file manager for Linux.
- Kiàn-ting also translated the (more widely used) social media Mastodon into Taiwanese Taigi in 2025 #footnoteCite(<kianting20250604>). The translation was initially merged into Mastodon in February 2026 and he presumably continues to maintain it.
- The Southern Min Wikipedia, while specifically for Southern Min (Hokkien / Minnan), still serves as prior art of Taigi translation as the two languages are mutually intelligible. #footnoteCite(<wikipedia-zh-min-nan>)

= Foundational choices

Before translation could start, there are a few foundational questions that I had to answer. These are: what should I call this language? Which language code should I use for it? And which writing system should I use?

== Language name <section-language-name>

*Final choice: _Taiwanese Taigi_ or _Taigi_ if possible, _Min Nan Chinese_ where I must*

Although the National Language Development Report #footnoteCite(<MOC20250616>) has settled this question in Taiwan ("Taiwanese Taigi" or "Taigi" in English, "臺灣台語" in Mandarin), this is not the established norm outside of Taiwan.

Right now, Taiwanese Taigi is regarded as a "variety" of Hokkien (Taiwanese Hokkien), and in international standards is referred to as a "variety" of "Min Nan Chinese", an English name that is transcribed through a Mandarin name of the language. The name "Min Nan Chinese" is used by Glibc locales, by Unicode CLDR, and others.

This situation is not ideal in regards to the principle of respecting the endonym of a language's own speakers, but I am one person and do not want to wait until international standards catch up in respecting this principle before I start the actual work of translating. Therefore, my choice here is to use the official name or the colloquial name if I can ("Taiwanese Taigi", "Taigi", or "Taiwanese"); and to refer to the language as "Min Nan Chinese" if I have to.

There is hope, however: a ISO 639-3 Change Request that establishes Taigi as its own language with its own language code, Change Request 2021-044 #footnoteCite(<iso639-3-CR2021-044>), is currently pending consideration. If this does get adopted, then the official language name will be more likely to be respected.

== Language code

*Final choice: _nan_TW_ for now*

Adjacent to the choice of the name of the language, software translations (including KDE) also require choosing a short name for the language or regional dialect. For example, British English is `en_GB`, and Japanese is `ja`. The international standard for this is ISO 639, with the de-facto standard being a mix of ISO 639-3 (comprehensive three-letter codes) and ISO 639-1 (two-letter codes).

The choice here is obvious: as Taigi doesn't have its own code yet (pending the aforementioned Change Request 2021-044 #footnoteCite(<iso639-3-CR2021-044>)), the next best code is `nan` for Min Nan Chinese, with a region code of `TW` to denote Taiwanese Minnan, ie. Taiwanese Hokkien.

== Writing system
*Final choice: two systems, mixed script (hàn-lô) and all-romanized (tsuân-lô), both using Tâi-lô orthography*

Compared to the vast number of people who speak Hokkien natively, it is historically rarely written down. This is related to how traditionally Chinese writing used to only write things in Literary Chinese. The same can be said for Taigi as well.

Taigi does have a large (in absolute terms) corpus of written material in a fairly standardized form, _Pe̍h-ōe-jī_ (literally "vernacular writing"), mostly written between the late 19th century and the mid 20th century.

Before I can translate anything, I have to decide on one (or two, as we'll see below) appropriate writing system. Taigi writing systems that have some actual use (and not just one dictionary writer's pet project) include:

- *Spelling Taiwanese Taigi words in an ad-hoc way using exclusively Han characters*. This has relatively widespread usage in older lyrics, but is usually disregarded as a legitimate writing system. Personally I regard this as a real writing system worthy of further research, as (contrary to popular belief) it is more regular than a completely ad-hoc system (for example, "guá" may be written as 哇 or 挖, characters pronounced as "wa" in Mandarin, but never as 蛙, another character with the same pronunciation in Mandarin). However, the fact that it is perceived as informal writing means it is clearly inappropriate for software UI translation.

- *Using Han characters exclusively but with an actually standardized set of characters*, also referred to as tsuân-hàn (全漢). Currently the regulator for which characters are correct is the Taiwan (ROC) Ministry of Education, but there is also a history of Taigi works in Han characters that don't depend on ad-hoc Mandarin pronunciations. Examples of the latter that I've seen include List Of Plants Of Formosa #footnoteCite(<sasaki1928>) and 商用台語 #footnoteCite(<wu1994>). Most Ministry of Education material is written in this style.

- *Using exclusively Latin characters*, or romanization (also referred to as 全羅). This is similar to the present Vietnamese writing system. There are two main systems for this: the aforementioned Pe̍h-ōe-jī, or the relatively new Tâi-lô. Pe̍h-ōe-jī was developed throughout the late 19th century by Christian missionaries, and is useful both as a transcription scheme for annotating Han characters as well as being used as a primary writing system. Taiwan's first newspaper, Tâi-oân-hú-siâⁿ Kàu-hōe-pò #footnoteCite(<tohskhp18850712>) (Taiwan Prefecture City Church Newspaper, now called Taiwan Church News) was written in this style for the first several decades of its life.

- *Using a mix of Han characters and Latin characters*, also referred to as hàn-lô (漢羅). This is similar to Japanese mixed script: write each word in whichever script that suits it best. The Latin characters are written in either Pe̍h-ōe-jī or Tâi-lô, but writers who write in this style always use standardized Han characters.

This may look like an unthinkably large number of writing systems, but indeed this list can be simplified to two items considering the following:

- Using ad-hoc Han characters can be ruled out as mentioned above.
- No one actually writes exclusively with Han characters. As noted by Tân Kiàn-tiong #footnoteCite(<kiantiong20230908>), even the Ministry of Education occasionally writes in mixed script in its Taigi dictionary #footnoteCite(<kautian>) when encountering certain loanwords. Apart from loanwords, the fact that the third person possessive pronoun 𪜶 (/in/) is poorly supported by fonts also means in practice it remains more convenient to fall back to writing words in romanization even when there is a preference to write as much in Han characters as practical.
- While Pe̍h-ōe-jī and Tâi-lô are often treated as separate systems, in reality Tâi-lô is a minor spelling reform on top of Pe̍h-ōe-jī. The way tones are marked remains identical; the convention of separating syllables within one compound with "-" instead of spaces is the same too. The only difference is that some consonants and vowels are spelled differently, such as `ch` in Pe̍h-ōe-jī being spelled `ts` in Tâi-lô, or `oe` in Pe̍h-ōe-jī being spelled `ue` in Tâi-lô, but the differences are one-to-one and unambiguous.

This leaves us with two systems: *mixed script (hàn-lô)* and *all romanized / all-Latin (tsuân-lô)*.

=== Feasibility of having two writing systems

As shown by several other languages such as Serbian, Uzbek, or even Mandarin, it is practical for languages to maintain two writing systems at the same time (also known as multi-script languages). #cite(<treyjones20180312>, form: "prose")#footnoteCite(<treyjones20180312>) goes through how Wikipedia handles some multi-script languages. Compared to those examples, using both mixed-script and all-Latin for Taigi is more complex than Serbian (where the two scripts are one-to-one) but somewhat less complex than handling Traditional Chinese and Simplified Chinese for Mandarin (where not only is the script conversion very hard, the two variants often effectively stand-in for different dialects). In other words, while it requires manual work from translators, using both mixed-script and all-Latin for Taigi is entirely feasible.

=== Pe̍h-ōe-jī or Tâi-lô?

There is still a question of whether I should use Pe̍h-ōe-jī or Tâi-lô. This question itself can get contentious, but I still need to make a choice and move on, as I consider them similar enough that it isn't worth the effort to support both (which would double the number of scripts to support from 2 to 4).

Ultimately I chose Tâi-lô because that's what the Ministry of Education, which I already refer to as an authority when deciding which Han characters are correct, has chosen on this topic. Since Tâi-lô does not conflict with Pe̍h-ōe-jī characters #footnoteCite(<iunn2021>), it would also be fine if one day another translator joins the project and decides to prefer Pe̍h-ōe-jī: mixed Tâi-lô and Pe̍h-ōe-jī might be inconsistent but would not be ambiguous. Moreover, software for automatically converting between the two already exist #footnoteCite(<ithuan-kesi>), so if this choice ever needs to be revisited it will be trivial to switch.

#figure(
  image("20260604T105105+0900-mixed-tl-poj.png"),
  caption: [Example of Tâi-lô and Pe̍h-ōe-jī being mixed in the same context. Screenshot from Southern Min Wikipedia's menu],
)

== Glibc locale

Glibc (the GNU C Library) provides core libraries for many Linux systems #footnoteCite(<glibc>), and includes a system of "locales", which define the name, date/time format, numeric format, territory, etc. of a given language variant.

A decision on this has already been made before me, in fact. A `nan_TW` locale has been available since 2013 #footnoteCite(<glibc-nan_TW>), and a `nan_TW@latin` locale has been available since 2009 #footnoteCite(<glibc-nan_TW_latin>). To quote the submission of `nan_TW@latin`:

#quote(block: true, attribution: [Arne Goetje])[
  Minnan can be written using Latin or traditional Han script. Therefor this locale has \@latin to clarify which script we use.
]

= Process

== KDE translation process

For some background, the normal KDE translation process #footnoteCite(<kde-translation-howto>) can be summarized like this:

1. Development and extraction: Developers write software with user-facing strings clearly marked for translation; the xgettext program from GNU gettext #footnoteCite(<gnu-gettext>) is used to extract these strings into "PO Template" files; then the msgmerge program from GNU gettext is used to merge the newly extracted template with the current translations, as "PO" files, if they exist. These translation files are stored in the KDE Subversion repository #footnoteCite(<websvn-kde>).

2. Translate: Translators then take existing PO files from the Subversion repository, translate them, then submit them. Some translators have direct commit access to the Subversion repository, so they can, after responsibly reviewing their submission, directly push translations into the repository; these translators are language coordinators of their translation teams. Other translators may send their translations to language coordinators, in whichever way each language coordinator or translation team sees fit. For example, the Simplified Chinese team gathers translations via their own Crowdin project, and their language coordinator periodically synchronizes the translations on their Crowdin project with the `zh_CN` translations in the KDE Subversion repository.

3. Push: The translated PO files are then pushed into the source repositories of KDE software, so that the next time they are built they will use the newly translated strings.

The process to extract strings from source repositories, merge them with existing translations, then push existing translations back into source repositories is automated by a _localization and internationalization service bot_ that runs daily called Scripty #footnoteCite(<scripty>).

== Requirements for creating a language team

Creating a new language team for KDE roughly requires providing the developers the information needed for it, as well as some initial translations for some KDE components. In particular, the modules `kcoreaddons`, `kio`, and `kxmlgui` need to be translated first #footnoteCite(<kde-translation-howto-starting>).

A compromise also had to be made for the language name: although Taiwanese Taigi is now the officially recommended formal name of this language, this has not been recognized by international standards such as ISO 639-3, or by systems that treat Taiwanese Hokkien as a regional variant of Min Nan Chinese and does not allow a regional variant to have a separate name, as seems to be the case for glibc locales. Thus, for the time being, until if and when ISO 639-3 CR 2021-044 #footnoteCite(<iso639-3-CR2021-044>) (establish Taigi as its own language with code `ftg`) is accepted, this language would have to be added with `nan_TW` as the language code and "Min Nan Chinese" as the English name.

== Translating for Taiwanese Taigi

As a Taiwanese Taigi language team does not already exist, I have to merge translation templates with my translations with my own automation. I also have to set up a translation "workspace" myself to most effectively utilize the capabilities of the Lokalize computer-aided translation system (also itself a KDE application) #footnoteCite(<lokalize>).

Lokalize provides translation memory (suggestions for translation from other similar source text entries), glossary management, seeing other languages for reference, and tracking translation progress across a whole tree of translation files, all for an offline folder of PO files without requiring a server while translating, without which this translation process would've likely been far more tedious.

=== Setting up translation workspace <set-up-workspace>

My translation folder, which I've come to refer to as my translation "workspace", is set up like this:

- *\~/kde-translations/l10n-templates*: a clone of the templates repository #footnoteCite(<kde-l10n-templates>), which has been migrated off Subversion and is now tracked in a Git repository.
- *\~/kde-translations/kde-svn*: a partial checkout of the Subversion repository, utilizing the `svn update --set-depth <depth>` feature #footnoteCite(<svn-redbook-depth>) to avoid downloading the entire repository's head revision. I set it up such that the partial checkout has this directory structure:
  - kde-svn/trunk/l10n-kf5
    - ja
    - zh_TW
  - kde-svn/trunk/l10n-kf6
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

#pagebreak()

=== Translating in Lokalize

#[
#show image: set image(width: 70%)

    After setting up the directory structure and setting up the Lokalize project, translation work can begin. I can open individual files from the project overview in Lokalize.

#figure(
  image("20260604T053624+0900-lokalize-project-overview.png"),
  caption: [Lokalize project overview, showing translation progress for each file. Files that exist in templates but don't exist in this translation project are nevertheless shown as 0% translated files, instead of being omitted.],
) <img-overview>

#figure(
  image("20260604T053057+0900-lokalize-translate-nan_TW@latin.png"),
  caption: [Translating a nan_TW\@latin (tsuân-lô) string in Lokalize. I have set Japanese as the source of alternate translations for nan_TW\@latin, so Alternate Translations shows the Japanese version of this string.],
) <img-nan_TW-latin>

In the view for each file, I then go through each text entry --- which corresponds to a string in the source code of the corresponding module --- and translate them. In this view I have access to Translation Memory features for similar source texts, matching or similar glossary entries, and alternative translations to aid in my translation.

    I start with `nan_TW@latin` (all-Latin) because this forces me to actually find Taigi words first before using them, instead of consciously or subconsciously falling back to Mandarin words all the time or mixing up Mandarin and Taigi knowledge.

    For the same reason, I also chose Japanese as my reference language.

#figure(
  image("20260604T053022+0900-lokalize-translate-nan_TW.png"),
  caption: [Translating a nan_TW (Hàn-lô) string in Lokalize. The project is set up to use the nan_TW\@latin project as its source of alternate translations, so the translation of the corresponding entry shows up in the Alternate Translations widget.],
) <img-nan_TW>

    I then go to the `nan_TW` version and re-type words from the all-Latin version, choosing appropriate Han characters or Tâi-lô representations. This is not really automatable #footnote[Not in a deterministic way like how conversion between POJ and TL is deterministic.], so this process is necessary.

    During this I am using Lokalize's glossary management to help maintain consistency as I translate.
    
#figure(
  image("20260604T053115+0900-lokalize-glossary.png"),
    caption: [The glossary view in Lokalize. On the left side is a list of glossary entries which includes each entry's source text and target text. On the right side is the editor for the currently selected glossary entry.],
) <img-glossary>
]

=== Word choices

As I translate, I often need to look up how to say a phrase or word in Taigi, in which case I may look it up on ChhoeTaigi #footnoteCite(<chhoetaigi>), Lohankha loanword transliteration system #footnoteCite(<lohankha-loanword>), or my own Kemdict #footnote[Unified search interface for many dictionaries for Taigi, Mandarin, and Hakka, including some Taigi sources not included by ChhoeTaigi (but missing some other sources in ChhoeTaigi), as well as providing fuzzy Taigi search that allows omitting tone marks. https://kemdict.com]. In particular, Kemdict allows me to search the Taiwan Public Television Service's Taigi TV New Words Dictionary (台語新詞辭庫) #footnoteCite(<pts-taigitv-new-words>) <footnotePts> together with other dictionaries, which is why I rely on it just as much as on ChhoeTaigi.

I also try to refer to prior art where it exists. For software translation I have not found much reference, except for Tân Kiàn-ting's Mastodon translation #footnoteCite(<kianting20250604>) which is immensely helpful where the same concepts have been mentioned.

When I cannot find what a concept should directly correspond with, I fall back to borrowing from English, or some other source language, or orthographically borrowing the word from Mandarin or Japanese (such as using si̍t-thé to correspond to _entity_ or _instance_).

Some examples include:

==== Answers already exist

- "Email" has already been translated into tiān-tsú phue-sìn (電子批信, lit. "electronic mail") by ChhoeTaigi's interface and others.
- "portable" (as in "portable computing device") has already been recorded as tshiú-thê (手提, lit. "hand-held") by Maryknoll Taiwanese-English Dictionary #footnoteCite(<maryknoll1976>).
- "donate" has already been orthographically borrowed from Japanese 寄付 (きふ, kifu) into Taigi as kià-hù (寄付) long ago #footnoteCite(<taijitFirst244>).

==== Borrow from English or another source language

The module `kconfigwidgets` contains a list of 106 languages. Some of these have obvious Taigi names, like Tik-gí (德語, German). Many of these are already on Southern Min Wikipedia #footnoteCite(<wikipedia-zh-min-nan-languages>). A few of these are borrowed directly from English or appear identical to the English name, such as Toki Pona. Some languages here are from their native language though, such as Catalunya-gí (lit. "_Catalunya_ language", Catalonian).

==== Orthographically borrowing from Mandarin

- "desktop environment" in Mandarin is calqued to 桌面環境 (zhuo1 mian4 huan2 jing4). I decided to do the same and translate it to toh-bīn khuân-kíng (桌面環境) in Taigi.
- "view" (as in display mode in a program, such as Icon View or Detailed View) is conventionally translated to 檢視 (jian3 shi4) in Taiwanese Mandarin, which is an extension to its original definition. I have decided to borrow it as kiám-sī (檢視) in Taigi, since the original word also already exists in Taigi. I later learned this was also the choice in the PTS New Words Dictionary @footnotePts.

==== Orthographically borrowing from Japanese

- For the phrase "Open Containing Folder" (meaning to open the folder that contains a particular file that the context will have made clear), I chose to handle it like the way the Japanese translation does it.

  When translating Mandarin, I found this string hard to translate, as the obvious one-to-one translation 開啟包含資料夾 loses the sense that the folder being opened is the one that contains the file in the context. In other words, this is easy to be confused with meaning the folder that is _contained_, not the folder that _contains_. My solution in Mandarin is to use 開啟所在資料夾 (open the folder that [the file] is located in).

  Japanese KDE translators have instead chosen to translate this as 保存フォルダを開く (open the folder [where the file is] saved). After comparing the two approaches and not having other ideas, I chose to adopt the same way Japanese does it, translating this string to "Phah-khui Pó-tsûn Tsu-liāu-giap-á" (拍開保存資料鋏仔), which seems both succinct and clear to me.

#pagebreak()

= Results

While the documented base modules are `kcoreaddons`, `kio`, and `kxmlgui`, I found that two other modules `kconfig` and `kconfigwidgets` seem just as helpful to translate when building a foundation for the overall translation. I had gotten these 5 modules to 87% translated overall, with `nan_TW@latin` being 92% translated and `nan_TW` being 83% translated, according to statistics collected with pocount from Translate Toolkit #footnoteCite(<pocount>). I then sent these translations upstream on June 8, 2026.

After some review and feedback, the initial translations were accepted into the KDE Subversion repository on June 15, 2026, thus creating the "Min Nan Chinese" and "Min Nan Chinese Latin" language teams #footnote[These names are necessary for now, as discussed in @section-language-name.]. Now that the team is created, I (or anyone interested) can now translate other modules and ship those translations.

There may still be other technical hurdles, but with a KDE translation team now established clearing them would be easier.

#[
    #set image(width: 70%)
#figure(
    grid(columns: 2,
        image("20260608T133631+0900.png"),
        image("20260608T133919+0900.png")
    ),
    caption: [`nan_TW@latin` translations in the Okular document viewer and `nan_TW` translations in the Gwenview image viewer.],
)
]

In this process I have also collected a Lokalize glossary of 195 entries. This is mainly useful for translating in Lokalize, but may be of use for others as well. I plan to publish them on a dedicated website as well to be able to better solicit reviews from other Taigi speakers.

The translation teams can be accessed on\
https://l10n.kde.org/team-infos.php?teamcode=nan_TW \
https://l10n.kde.org/team-infos.php?teamcode=nan_TW%40latin

While the staging translations are published on GitHub:\
https://github.com/kisaragi-hiu/kde-l10n-nan_tw

#pagebreak()

= Discussion

It would be a shame if Taigi were lost as a language, but as in the National Languages Development Report #footnoteCite(<MOC20250616>) Taigi would be on its way to obscurity without revitalization efforts. The written language is one part in this effort, and it is my wish to establish Taigi computing environments in order to at the very least offer an option for Taigi speakers and learners to be more exposed to written Taigi in daily life.

Further work will be needed to translate more applications in order to provide a computing environment that is completely (or sufficiently close to completely) translated into Taigi. This may be challenging, mostly to do with a lack of manpower#footnote[Even the KDE Traditional Chinese team has mostly just been me in the last 3 years. These statistics aren't automatically collected, but by running `svn log` on the l10n-kf6/zh_TW folder on the KDE Subversion repository I can see that between 2023 and now, 282 out of 290 translation commits (97%) are from me (KDE Identity username `moonlight`).], but is well within the realms of feasibility. It may, however, be favorable if relevant communities or organizations also recognize the importance of having software be available in Taigi as an option.

For the translation team, work will also be needed to set up a website and figure out where and how to collaborate with other translators or Taigi speakers who may be interested in helping out. One immediate work item would be an overview website for current word choices.

During this process I relied heavily on Lokalize for its local computer-aided translation (CAT) features. Lokalize allows easily viewing statistics, creating new translation files based on new translation templates, handling glossary, handling translation memory. Lokalize, however, lacks certain features to make utilizing its capabilities easier for new translators: for example, I had to set up my translation workspace manually, as outlined in @set-up-workspace --- or write a program myself to automate it#footnote[I avoided mentioning this tool in @set-up-workspace as it would needlessly complicate the section. The tool is available at https://github.com/kisaragi-hiu/k-kdesvn]. It also lacks features that would make working with multi-script languages nicer: for example, when working on `nan_TW` (mixed-script) I would wish to see both `nan_TW@latin` and Japanese strings as references, but Lokalize only supports showing one alternate language, not multiple, so I had to choose one (`nan_TW@latin`) while giving up the other. Improvements for Lokalize are thus also an area of work I would like to see happen, both from myself and others (although this is out of scope from specifically Taigi translations).

#pagebreak()

= Declarations

== Potential conflict of interest

I am already a KDE translator for Traditional Chinese (Taiwanese Mandarin), and have been for the last 5 years.

I am a KDE e.V. voting member because of this work.

== AI usage

- I have occasionally asked a chatbot for a second opinion on the translation of specific words. The results are always judged by my knowledge of the language (I only use them as a reminder), and I have been trying this less and less, as I found this to rarely be as passably correct as simply borrowing from another language.
- There are 106 strings in `kconfigwidgets._desktop_.po`, which are all language names. Through my own search I've filled 44 of them already. The rest seems like I would have to copy from Hokkien Wikipedia.

  I tried using Gemini CLI for this task once, using gemini-3-flash-preview with this prompt: #quote(block: true)[> ./words.po is a Gettext PO file that contains a list of languages in English. Please fill in their translations in Taiwanese Hokkien#footnote[I would prefer "Taigi", but figured the model would understand "Taiwanese Hokkien" better.]. Use your search tool if available.]

  I then reviewed the result and incorporated them as appropriate. Almost all strings turned out to need further tweaking by me looking them up on Hokkien Wikipedia again myself. This helped in only three minor ways:

  - By having 62 filled-in but slightly wrong strings, this motivated me to go through each of them and figure out something better, instead of being intimidated by 62 empty strings.
  - I learned that Crimea is probably better borrowed into Taigi directly from Ukrainian, such that Crimean Tatar is _Krym Tatar-gí_. On further reflection, however, perhaps an even better choice would be the native name in Crimean Tatar, _qırımtatar_, or a localized spelling of it (_qirimtatar_, with the Turkic dotless _ı_ replaced with _i_).
  - I realized that I could translate Latin (script) into "Lô-má-jī" (literally "Rome characters") instead of the clumsy "La-ting bûn-jī".

- I used Gemini CLI for grammar review once with this prompt: #quote(block: true)[> Review ./nkust-report.typ [referring to this report] for grammar and flow. Review means to not edit anything, so do not edit anything#footnote[This is in response to an earlier attempt where it tried to initiate edits despite telling it to "review".]. Do not address me as a person.]

  This caught a few leftover partial sentences, repetitive or inconsistent word choices, and minor verb tense or number issues, which I then fixed myself.

#pagebreak()
#heading(numbering: none)[Acknowledgements]

This work is built on the shoulder of many giants.

On the software side, I would like to thank Lokalize developers for making such a crucial piece of my workflow (especially Finley Watson for reviewing my occasional Merge Requests); as well as Typst, for being a fast and easy alternative to LaTeX, with as much flexibility as the Lisp-based documentation systems that I've used in the past while having a lot more batteries included. The table of contents is a one-liner and required barely any bookkeeping, allowing me to focus on translating and writing this report.

On the Taigi side, I would like to thank Arne Goetje #footnoteCite(<glibc-nan_TW_latin>) and Wei-Lun Chao #footnoteCite(<glibc-nan_TW>) for contributing Taigi locales (as Min Nan Chinese) into glibc ages ago, in 2009 and 2013, respectively; Ìthuân Khoki, for submitting ISO 639-3 CR 2021-044 #footnoteCite(<iso639-3-CR2021-044>); Dr. Iûⁿ Ún-giân, ChhoeTaigi and the Tâi-bûn Ke-si Mī project, and countless others for all the work on Taigi revitalization; and all those who made the dictionaries that I've been relying on, especially the Ministry of Education's Dictionary of Frequently-Used Taiwanese Taigi #footnoteCite(<kautian>), the Maryknoll Taiwanese-English Dictionary #footnoteCite(<maryknoll1976>), the Comprehensive Taiwanese-Japanese Dictionary by 小川尚義 #footnoteCite(<taijit>) and its Taigi translation by Elder Lîm Chùn-io̍k #footnoteCite(<taijit-taigi>), as well as the Taiwan Public Television Service's Taigi TV New Words Dictionary (台語新詞辭庫) #footnoteCite(<pts-taigitv-new-words>).

Lastly, on a more personal note, I would like to thank my advisor, Dr. Wu Yi-ping, for being willing to take on the advisor role for this independent study in my 8th year of my 4 year undergraduate college study, as well as express my gratitude for every professor and instructor in the English department, who have greatly helped in my studies.

I would also like my parents for financially supporting me 4 years past my originally scheduled graduation date.

#pagebreak()
#heading(numbering: none)[Bibliography]

#bibliography("bibliography.bib", style: "apa", title: none)

// Local Variables:
// typst-preview--master-file: "nkust-report.typ"
// citar-bibliography: ("bibliography.bib")
// End:
