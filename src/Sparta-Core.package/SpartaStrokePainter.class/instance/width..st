accessing
width: aFloat
	"Do not request custom stroke options if requested
	width equal to default one"
	aFloat = self class defaultWidth
		ifTrue: [ ^ self ].
	self strokeOptions width: aFloat