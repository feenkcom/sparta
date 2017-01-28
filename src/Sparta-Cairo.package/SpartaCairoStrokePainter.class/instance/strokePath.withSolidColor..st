drawing
strokePath: aPath withSolidColor: aColor

	self strokePath: aPath with: [ 
		self primSetSourceR: aColor red G: aColor green B: aColor blue A: aColor alpha ]