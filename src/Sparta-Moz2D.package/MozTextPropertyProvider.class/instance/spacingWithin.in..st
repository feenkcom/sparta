accessing
spacingWithin: anInterval in: anArray
	| aSpacing |
	
	aSpacing := self spacing.

	anInterval withIndexDo: [ :aStringIndex :anArrayIndex |
		"Set spacing only after character"
		anArray at: ((anArrayIndex - 1) * 2) + 1 put: 0.
		anArray at: ((anArrayIndex - 1) * 2) + 2 put: aSpacing ]