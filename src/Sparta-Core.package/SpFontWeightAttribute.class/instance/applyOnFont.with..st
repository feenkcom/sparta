properties
applyOnFont: aFontBuilder with: aSpan

	weight isNumber
		ifTrue: [ aFontBuilder weight: weight ]
		ifFalse: [ weight isSymbol
			ifTrue: [ aFontBuilder perform: weight ]
			ifFalse: [ self error: 'Unknown weight: ', weight asString ] ]