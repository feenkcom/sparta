rendering
renderLine: aLine on: aCanvas
	| iterator |
	
	lineHeight := 0.
	iterator := aLine iterator: 1 to: aLine size.
	[ iterator hasNext ] whileTrue: [ 
		| span |
		span := iterator nextSpan.
		self renderSpan: span on: aCanvas. ].
	self baseline: 0@(self baseline y + lineHeight).