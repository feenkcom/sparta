drawing
maskSurface: aSurface
		
	self
		primMaskSurface: (source asMozPatternOn: canvas)
		mask: aSurface
		offsetX: (offset ifNil: 0 ifNotNil: #x)
		offsetY: (offset ifNil: 0 ifNotNil: #y)
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])