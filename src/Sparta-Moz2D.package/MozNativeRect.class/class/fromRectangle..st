instance creation
fromRectangle: aRectangle

	^ self new
		x: aRectangle origin x;
		y: aRectangle origin y;
		width: aRectangle width;
		height: aRectangle height