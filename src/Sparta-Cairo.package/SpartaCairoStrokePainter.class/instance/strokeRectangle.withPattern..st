drawing
strokeRectangle: aRectangle withPattern: aCairoPattern

	self strokeRectangle: aRectangle with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]