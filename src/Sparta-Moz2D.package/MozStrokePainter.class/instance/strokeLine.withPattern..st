drawing
strokeLine: aLine withPattern: aMozPattern
	self
		primStrokeLineFromX: aLine from x
		fromY: aLine from y
		toX: aLine to x
		toY: aLine to y
		pattern: (aMozPattern asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])