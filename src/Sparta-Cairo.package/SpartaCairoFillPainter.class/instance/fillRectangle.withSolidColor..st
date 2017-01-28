drawing
fillRectangle: aRectangle withSolidColor: aColor
	
	self fillRectangle: aRectangle with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]