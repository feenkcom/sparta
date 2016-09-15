instance creation
generic: aMozFontFamilyType
	"Creates a font list with one generic family name, e.g sans-serif, serif
	@see MozFontFamilyType enum"
	^ (self primCreateGeneric: aMozFontFamilyType)
		autoRelease;
		yourself