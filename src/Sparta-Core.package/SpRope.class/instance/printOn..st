printing
printOn: aStream
	(Array streamContents: [ :anArrayStream |
		self putOn: anArrayStream ]) do: [ :anElement |
			anElement isCharacter
				ifTrue: [ aStream nextPut: anElement ]
				ifFalse: [ aStream nextPutAll: anElement asString ] ]