initialization
initializeLine: aLine on: aCanvas
	| iterator lineWidth availableWidth |

	lineHeight := 0.
	lineWidth := 0.
	availableWidth := self maxWidth.
	
	iterator := aLine iterator: 1 to: aLine size.
	[ iterator hasNext ] whileTrue: [ 
		| span |
		span := iterator nextSpan.
		self renderSpan: span on: aCanvas. ].
	self baseline: 0@(self baseline y + lineHeight).