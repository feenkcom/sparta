drawing
strokeLine: aLine withSolidColor: aColor
	self
		primStrokeLineFromX: aLine from x
		fromY: aLine from y
		toX: aLine to x
		toY: aLine to y
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])