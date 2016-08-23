drawing
fillRectangle: aRectangle withSolidColor: aColor
	self
		primFillX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha 
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])