accessing
drawOptions: aSpartaDrawOptions
	"Set additional draw parameters used during drawing.
	DrawOptions define global alpha value, composition operator
	and antialias mode.
	If drawOptions are not specified during construction,
	a default ones will be used. See TSpartaDrawOptions default.
	aSpartaDrawOptions must not be nil"
	<optional>

	self
		assert: [ aSpartaDrawOptions isNotNil ]
		description: [ 'DrawOptions must not be nil!' ].
		
	drawOptions := aSpartaDrawOptions