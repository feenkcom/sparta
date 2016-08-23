drawing
strokePath: aPath withSurface: aSpartaSurfacePaint
	self
		primStrokePath: aPath
		pattern: (aSpartaSurfacePaint asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])