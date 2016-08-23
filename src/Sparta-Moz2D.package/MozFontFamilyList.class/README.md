I represent a font family list, array of font families and a default font type.
Font family names are either named strings or generics.
The default font type is used to preserve the variable font fallback behavior

Examples:

Empty family list with none default font type:
	MozFontFamilyList empty
	
Empty family list with specified default font type:
	MozFontFamilyList default: MozFontFamilyType sansSerif
	
Add named font family:
	MozFontFamilyList empty add: 'Arial'

Add generic font family:
	MozFontFamilyList empty add: MozFontFamilyType sansSerif
	
Add font family name object (will add a copy of it):
	MozFontFamilyList empty add: (MozFontFamilyName named: 'Helvetica')
	
Get an array of all font family name objects (returns a copies):
	list fontNames