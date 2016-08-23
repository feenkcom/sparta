printing
printStyle
	|aStyle|
	aStyle := self style.
	
	^ String streamContents: [ :aStream |
		aStyle = 0 ifTrue: [ aStream nextPutAll: 'Normal' ].
		aStyle & 1 > 0 ifTrue: [  aStream nextPutAll: 'Italic' ].
		aStyle & 2 > 0 ifTrue: [  aStream nextPutAll: 'Oblique' ].
		aStream isEmpty ifTrue: [ aStream nextPutAll: 'Unknown (', aStyle, ')' ] ]