drawing
strokeRectangle: aRectangle withSolidColor: aColor

	self strokeRectangle: aRectangle with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]