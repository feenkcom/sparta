accessing
build
	| aFamilyName theFallbackFonts aLogicalFont |
	
	aFamilyName := (fontList isNil or: [ fontList isEmpty ])
		ifTrue: [ StandardFonts defaultFont familyName ]
		ifFalse: [ fontList first ].

	theFallbackFonts := fontList ifNotNil: [
		fontList
			ifEmpty: [ nil ]
			ifNotEmpty: [ fontList allButFirst ] ].
	
	aLogicalFont := LogicalFont
		familyName: aFamilyName
		fallbackFamilyNames: theFallbackFonts
		pointSize: size
		stretchValue: stretch
		weightValue: weight
		slantValue: style.
		
	^ SpartaCairoFreetypeFontFace create: aLogicalFont asFreetypeFont