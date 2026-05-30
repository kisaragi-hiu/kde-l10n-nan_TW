#set heading(numbering: "1.1.")

#title("Translating KDE Software Into Taiwanese Taigi")

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

== What it takes to translate KDE software into another language

Translations of KDE software are managed in a centuralized system @kde_l10n and has an established procedure. Each language has a _translation team_, which translates strings extracted from the source code; the translated strings are then pulled into each individual project and used for displaying messages to users.

TODO: do we mention translating kcoreaddons/kxmlgui/kio, and the glibc locale, and the QLocale?

= Foundational choices

Before translation can start, there are a few foundational questions that I had to answer. These are: what should I call this language? Which language code should I use for it? And which writing system should I use?

== Language name

Although the National Language Development Report @MOC20250616 has settled this question in Taiwan ("Taiwanese Taigi" or "Taigi" in English, "臺灣台語" in Mandarin), this is not the established norm outside of Taiwan.

Right now, Taiwanese Taigi is regarded as a "variety" of Hokkien (Taiwanese Hokkien), and in international standards is referred to as a "variety" of "Min Nan Chinese", an English name that is transcribed through a Mandarin name of the language.

This situation is not ideal in regards to the principle of respecting the endonym of a language's own speakers, but I am one person and do not want to wait until international standards catch up in respecting this principle before I start the actual work of translating. Therefore, my choice here is to use the official name or the colloquial name if I can ("Taiwanese Taigi", "Taigi", or "Taiwanese"); and to refer to the language as "Min Nan Chinese" if I have to.

There is hope, however: a ISO 639-3 Change Request that establishes Taigi as its own language with its own language code, Change Request 2021-044 @iso639-3-CR2021-044, is currently pending consideration. If this does get adopted, then the official language name will be more likely to be respected.

== Language code

Adjacent to the choice of the name of the language, software translations (including KDE) also requires choosing a short name for the language or regional dialect. For example, British English is `en_GB`, and Japanese is `ja`. The international standard for this is ISO 639, with the de-facto standard being a mix of ISO 639-3 (comprehensive three-letter codes) and ISO 639-1 (two-letter codes).

The choice here is obvious, as Taigi doesn't have its own code yet (pending the aforementioned Change Request 2021-044 @iso639-3-CR2021-044), the next best code is `nan` for Min Nan Chinese, with a region code of `TW` to denote Taiwanese Minnan, ie. Taiwanese Hokkien.

== Writing system

Compared to the vast number of people who speak Hokkien natively, it is historically rarely written down. This is related to how traditional Chinese writing used to only write things in Literary Chinese. The same can be said for Taigi as well.

Taigi does have a large (in absolute terms) corpus of written material in a fairly standardized form, _Pe̍h-ōe-jī_ (literally "vernacular writing"), mostly written between the late 19th century and the mid 20th century.

Before I can translate anything, I have to decide on one (or two, as we'll see below) appropriate writing system. Taigi writing systems that have some actual use (and not just one dictionary writer's pet project) include:

- *Spelling Taiwanese Taigi words in an ad-hoc way using exclusively Han characters*. This has relatively widespread usage in older lyrics, but is usually disregarded as a legitimate writing system. Personally I regard this as a real writing system worthy of further research, as (contrary to popular belief) it is more regular than a completely ad-hoc system (for example, "guá" may be written as 哇 or 挖, characters pronounced as "wa" in Mandarin, but never as 蛙, another character with the same pronunciation in Mandarin). However, the fact that it is perceived as informal writing means it is clearly inappropriate for software UI translation.

- *Using Han characters exclusively but with an actually standardized set of characters*, also referred to as tsuân-hàn (全漢). Currently the regulator for which characters are correct is the Taiwan (ROC) Ministry of Education, but there is also a history of Taigi works in Han characters that don't depend on ad-hoc Mandarin pronunciations. Examples of the latter that I've seen include List Of Plants Of Formosa @sasaki1928 and 商用台語 @wu1994. Most Ministry of Education material is written in this style.

- *Using exclusively Latin characters*, or romanization (also referred to as 全羅). This is similar to the present Vietnamese writing system. There are two main systems for this: the aforementioned Pe̍h-ōe-jī, or the relatively new Tâi-lô. Pe̍h-ōe-jī was developed throughout the late 19th century by Christian missionaries, and is useful both as a transcription scheme for annotating Han characters and as a primary writing system.

  TODO: quote tâi-oân-hú-siâⁿ kàu-hōe-pò
  TODO: mention how Tâi-lô is a minor spelling reform over Pe̍h-ōe-jī

- *Using a mix of Han characters and Latin characters*, also referred to as hàn-lô (漢羅). This is similar to Japanese mixed script: write each word in whichever script that suits it best. The Latin characters are written in either Pe̍h-ōe-jī or Tâi-lô, but writers who write in this style always use standardized Han characters.

This may look like an unthinkably large number of writing systems, but indeed this list can be simplified to two items considering a few facts.

- Using ad-hoc Han characters is ruled out as mentioned above.
- No one actually writes exclusively with Han characters. As noted by Tân Kiàn-tiong @kiantiong20230908, even the Ministry of Education occasionally writes in mixed script in its Taigi dictionary @kautian when encountering certain loanwords. Apart from loanwords, the fact that the third person possessive pronoun 𪜶 (/in/) is poorly supported by fonts also means in practice it remains more convenient to fall back to writing words in romanization even when there is a preference to write as much in Han characters as practical.
- While Pe̍h-ōe-jī and Tâi-lô are often treated as separate systems, in reality Tâi-lô is a minor spelling reform on top of Pe̍h-ōe-jī. The way tones are marked remains identical; the convention of separating syllables within one compound with "-" instead of spaces is the same too. The only difference is that some consonants and vowels are spelled differently, such as `ch` in Pe̍h-ōe-jī being spelled `ts` in Tâi-lô, or `oe` in Pe̍h-ōe-jī being spelled `ue` in Tâi-lô, but the differences are one-to-one and unambiguous.

This leaves us with two systems: *mixed script (hàn-lô)* and *exclusively romanization (tsuân-lô)*.

=== Pe̍h-ōe-jī or Tâi-lô?

There is still a question of whether I should use Pe̍h-ōe-jī or Tâi-lô. This question itself can get contentious, but I still need to make a choice and move on, as I consider them similar enough that it isn't worth the effort to support both (which would double the number of scripts to support from 2 to 4).

Ultimately I chose Tâi-lô because that's what the Ministry of Education, which I already refer to as an authority when deciding which Han characters are correct, has chosen on this topic. Since Pe̍h-ōe-jī and Tâi-lô are compatible with each other, it would be totally fine if one day another translator joins the project and decides to prefer Pe̍h-ōe-jī: mixed Tâi-lô and Pe̍h-ōe-jī might be inconsistent but would not be ambiguous. Moreover, software for automatically converting between the two already exist @ithuan-kesi, so if this choice ever needs to be revisited it will be trivial to switch.

== Glibc locale

Glibc (the GNU C Library) provides core libraries for many Linux systems @glibc, and includes a system of "locales", which define the name, date/time format, numeric format, territory, etc. of a given language variant.

A decision on this has already been made before me, in fact. A `nan_TW` locale has been available since 2013 @glibc-nan_TW, and a `nan_TW@latin` locale has been available since 2009 @glibc-nan_TW_latin. To quote the submittion of `nan_TW@latin`:

#quote(block: true, attribution: [Arne Goetje])[
  Minnan can be written using Latin or traditional Han script. Therefor this locale has \@latin to clarify which script we use.
]

#bibliography("bibliography.bib")

// Local Variables:
// typst-preview--master-file: "/home/kisaragi-hiu/kde-translations/l10n-nan_TW-repo/nkust-report.typ"
// citar-bibliography: ("bibliography.bib")
// End:
