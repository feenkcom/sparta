building
build
	| aFontFace |
	self
		assert: [ familyName isNotNil and: [ familyName isNotEmpty ] ]
		description: [ 'Family name is required' ].
		
	self
		assert: [ source isNotNil ]
		description: [ 'Source is required' ].
		
	aFontFace := SpUserFontFace new
		familyName: familyName;
		source: source asSpartaFontSource;
		style: style;
		weight: weight;
		stretch: stretch;
		unicodeRange: unicodeRange.

	self userFontSet add: aFontFace