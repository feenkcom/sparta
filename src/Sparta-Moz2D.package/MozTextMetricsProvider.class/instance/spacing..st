accessing
spacing: aNumber
	spacing := aNumber.
	spacing > 0
		ifTrue: [ self enableSpacing ]
		ifFalse: [ self disableSpacing ]