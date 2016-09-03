! SpartaFontBuilder
I am a font builder. See *https://www.w3.org/TR/CSS2/fonts.html* for more information about fronts styles.

!! Overview

I help developers to create backend specific font groups. A font group consists of font families and style. Font family can defined be named ("Arial", "Times new Roman", etc) and generic ("sans-serif", "serif", "monospace", etc). Font style is represented by a set of properties which include size, weight, stretch, style kind (oblique, bold) and language.

I am created and managed by canvas. Fonts are backend specific and must be only created by me. Created fonts can be later used by text painter to actually render strings.

!! Public API and Key Messages

- ==build== - finish  creation and return font group.
- ==named:== add named font family to the font group.
- ==cursive== - add cursive font family to the group.
- ==fantasy== - add fantasy generic font family to the group.
- ==fixed== - add fixed generic font family to the group.
- ==monospace== - add monospace generic font family to the group.
- ==sansSerif== - add sans-serif generic font family to the group.
- ==serif== - add serif generic font family to the group.
- ==size:== - set required font size in pixels
- ==stretch*== - set stretch mode (condensed, expanded, normal). Do not set stretch value directly, because its actual value is backend specific.
- ==style*== - set style kind (Italic, Oblique, Normal). Do not set style value directly, in general it is backend specific.
- ==weight*== - set named font weight (Bold, Normal, Thin).
- ==weight:== - set weight value, it should be a number in interval [ 100 ... 800 ]. Weight is not backend specifc and can be set directly. 

[[[language=smalltalk
font := canvas font
	sansSerif;
	named: 'Arial';
	size: 18;
	styleItalic;
	weightThin;
	build.
]]]

!! Internal Representation and Key Implementation Points

!!! Instance Variables

- language:	==<String>==
- size:		==<Number>==
- stretch:	==<Enum>==
- style:	==<Enum>==
- weight:	==<Number>==

!!! Implementation Points

Users should rely as less as possible on raw style values and use builder messages instead
