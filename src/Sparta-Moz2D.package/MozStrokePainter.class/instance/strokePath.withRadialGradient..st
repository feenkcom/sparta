drawing
strokePath: aPath withRadialGradient: aSpartaRadialGradient
	
	self
		primStrokePath: aPath
		pattern: (aSpartaRadialGradient asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])