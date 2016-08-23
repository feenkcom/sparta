shapes
roundedRectangle: aRectangle radii: cornerRadii
	
	^ self
		primRoundedRectangleX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
		tlr: cornerRadii topLeft
		trr: cornerRadii topRight
		brr: cornerRadii bottomRight
		blr: cornerRadii bottomLeft