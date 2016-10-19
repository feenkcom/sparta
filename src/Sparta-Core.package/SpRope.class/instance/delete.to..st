accessing
delete: aStart to: anEnd
	aStart = anEnd
		ifTrue: [ ^ self ].

	^ (self from: 1 to: aStart) append: (self from: anEnd + 1 to: self size)