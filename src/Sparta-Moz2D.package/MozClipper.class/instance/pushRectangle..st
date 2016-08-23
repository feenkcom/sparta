clipping
pushRectangle: aRectangle

	self
		primPushClipRectangleX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height