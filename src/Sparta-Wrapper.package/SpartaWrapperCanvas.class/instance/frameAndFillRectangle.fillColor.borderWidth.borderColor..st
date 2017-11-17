drawing-rectangles
frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth borderColor: borderColor
	"Draw the rectangle using the given attributes"
	
	fillColor isTransparent ifFalse: [ 
		self canvas fill
			paint: fillColor;
			path: r;
			draw ].

	(borderWidth isZero or: [ borderColor isTransparent ])
		ifFalse: [
			self canvas stroke
				paint: borderColor;
				path: r;
				width: borderWidth;
				draw ]