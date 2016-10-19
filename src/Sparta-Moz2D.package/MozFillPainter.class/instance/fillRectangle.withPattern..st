drawing
fillRectangle: aRectangle withPattern: aMozPattern

	self
		primFillRect: (MozNativeRect fromRectangle: aRectangle)
		pattern: (aMozPattern asMozPatternOn: canvas)
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])