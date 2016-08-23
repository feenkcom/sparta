drawing
strokeRectangle: aRectangle withSolidColor: aColor
	self
		primStrokeX: aRectangle left
		y: aRectangle top
		width: aRectangle width 
		height: aRectangle height
		r: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])