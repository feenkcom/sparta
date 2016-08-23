drawing
strokeRectangle: aRectangle withSurface: aSpartaSurfacePaint
	self
		primStrokeRect: (MozNativeRect fromRectangle: aRectangle)
		pattern: (aSpartaSurfacePaint asMozPatternOn: canvas)
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])