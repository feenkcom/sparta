private
fontListAdd: aFontName

	fontList ifNil: [ fontList := OrderedCollection new ].
	fontList add: aFontName