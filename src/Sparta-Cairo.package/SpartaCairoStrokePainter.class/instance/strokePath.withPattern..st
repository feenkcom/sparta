drawing
strokePath: aPath withPattern: aCairoPattern

	self strokePath: aPath with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]