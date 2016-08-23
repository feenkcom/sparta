drawing
fillPath: aPath withPattern: aMozPattern
	self
		primFillPath: aPath
		pattern: (aMozPattern asMozPatternOn: canvas)
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])