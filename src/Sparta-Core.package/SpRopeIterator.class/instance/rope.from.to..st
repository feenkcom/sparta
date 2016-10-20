instance creation
rope: aRope from: aStart to: anEnd
	(aStart < 1 or: [ anEnd > aRope size ])
		ifTrue: [ self error: 'Iterator interval out of bounds!' ].
	(anEnd > 0 and: [ aStart > anEnd ])
		ifTrue: [ self error: 'Iterator interval out of bounds!' ].

	rope := aRope.
	start := aStart.
	end := anEnd.