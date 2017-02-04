drawing
strokeLine: aLine withPattern: aCairoPattern

	self strokeLine: aLine with: [ 
		self primSetSourcePattern: (aCairoPattern asSpartaCairoPatternOn: canvas) ]