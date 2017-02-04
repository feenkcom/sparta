drawing
strokeLine: aLine withSolidColor: aColor

	self strokeLine: aLine with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]