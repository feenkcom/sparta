accessing
defaultFontType: aFontFamilyType
	"A default font type can be either none, serif or sans-serif!"
	self assert: [  aFontFamilyType = MozFontFamilyType none
		or: [ aFontFamilyType = MozFontFamilyType serif
			or: [ aFontFamilyType = MozFontFamilyType sansSerif ] ] ]
		description: 'Can only be none, serif or sans-serif'.
		
	self primSetDefaultFontType: aFontFamilyType