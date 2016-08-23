drawing
strokeRectangle: aRectangle withRadialGradient: aSpartaRadialGradient
	self
		primStrokeRect: (MozNativeRect fromRectangle: aRectangle)
		pattern: (aSpartaRadialGradient asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])