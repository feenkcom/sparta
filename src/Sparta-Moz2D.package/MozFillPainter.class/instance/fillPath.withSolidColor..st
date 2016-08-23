drawing
fillPath: aPath withSolidColor: aColor
	self
		primFillPathColor: aPath
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])