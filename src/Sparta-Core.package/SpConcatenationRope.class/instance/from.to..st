accessing
from: aStart to: anEnd
	| leftSize |
	
	aStart < 1
		ifTrue: [ self error: 'Illegal sub-sequence start index: ', aStart asString ].
	anEnd > self size
		ifTrue: [ self error: 'Illegal sub-sequence end index: ', anEnd asString ].
		
	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self ].
	
	leftSize := left size.
	anEnd <= leftSize
		ifTrue: [ ^ left from: aStart to: anEnd ].
	
	aStart > leftSize
		ifTrue: [ ^ right from: aStart - leftSize to: anEnd - leftSize ].

	^ self class
		concatenate: (left from: aStart to: leftSize)
		and: (right from: 1 to: anEnd - leftSize)