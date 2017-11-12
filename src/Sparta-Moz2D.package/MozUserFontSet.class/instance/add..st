adding
add: aUserFontFace
	| aFontEntry aBuffer aFontStyle |
	"Create and add a new font face from a source to a given family name"

	(self hasFontFace: aUserFontFace)
		ifTrue: [ ^ self ].
		
	aBuffer := aUserFontFace source fontContents.
	
	aFontStyle := MozFontStyle
		style: aUserFontFace style value
		weight: aUserFontFace weight value
		stretch: aUserFontFace stretch value.

	aFontEntry := self
		findOrCreateFontEntry: aUserFontFace familyName
		buffer: aBuffer
		style: aFontStyle.

	aFontEntry fontFace: aUserFontFace.
	aFontEntry buffer: aBuffer.

	self addFontEntry: aFontEntry