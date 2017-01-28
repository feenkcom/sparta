drawing
fillPath: aPath withSolidColor: aColor

	self fillPath: aPath with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]