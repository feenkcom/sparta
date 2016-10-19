accessing
at: anIndex
	((anIndex > self size) or: [ anIndex < 1 ])
		ifTrue: [ self error: 'An index(', anIndex asString. ') is out of range [1..', self size asString,']' ].

	^ (anIndex <= left size)
		ifTrue: [ left at: anIndex ]
		ifFalse: [right at: anIndex - right size + 1 ]