drawing
fillPath: aPath withPattern: aCairoPattern

	self fillPath: aPath with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]