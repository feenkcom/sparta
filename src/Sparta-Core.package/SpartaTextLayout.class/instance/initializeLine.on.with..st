initialization
initializeLine: aLine on: aCanvas with: aContext
	| iterator |

	iterator := aLine iterator: 1 to: aLine size.
	[ iterator hasNext ] whileTrue: [ 
		| span |
		span := iterator nextSpan.
		self initializeSpan: span on: aCanvas with: aContext ].
	aContext pushLine