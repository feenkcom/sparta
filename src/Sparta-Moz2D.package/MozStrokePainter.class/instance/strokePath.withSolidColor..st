drawing
strokePath: aPath withSolidColor: aColor
	self
		primStrokePath: aPath
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])