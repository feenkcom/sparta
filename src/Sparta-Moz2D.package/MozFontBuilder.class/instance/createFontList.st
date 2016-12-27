private - instance creation
createFontList
	| aFontList |
	
	fontList ifNil: [
		^ MozFontFamilyList generic: MozFontFamilyType sansSerif ].

	aFontList := MozFontFamilyList empty.
	fontList ifEmpty: [ self sansSerif ].
	fontList do: [ :each | aFontList add: each ].

	^ aFontList