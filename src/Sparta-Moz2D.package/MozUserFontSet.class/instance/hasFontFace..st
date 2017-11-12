testing
hasFontFace: aUserFontFace
	"Return true if I already contain a font face in a given family from provided source"
	<return: #Boolean>

	^ fontEntries
		at: aUserFontFace familyName
		ifPresent: [ :theFontEntries | theFontEntries anySatisfy: [ :aFontEntry | aFontEntry fontFace = aUserFontFace ] ]
		ifAbsent: [ false ]