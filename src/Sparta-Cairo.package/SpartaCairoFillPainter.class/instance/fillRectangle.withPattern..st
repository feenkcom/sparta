drawing
fillRectangle: aRectangle withPattern: aCairoPattern

	self fillRectangle: aRectangle with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]