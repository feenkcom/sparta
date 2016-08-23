drawing
strokePath: aPath withLinearGradient: aSpartaLinearGradient

	self
		primStrokePath: aPath
		pattern: (aSpartaLinearGradient asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])