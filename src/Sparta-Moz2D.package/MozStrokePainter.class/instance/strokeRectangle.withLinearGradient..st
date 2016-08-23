drawing
strokeRectangle: aRectangle withLinearGradient: aSpartaLinearGradient
	self
		primStrokeRect: (MozNativeRect fromRectangle: aRectangle)
		pattern: (aSpartaLinearGradient asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])