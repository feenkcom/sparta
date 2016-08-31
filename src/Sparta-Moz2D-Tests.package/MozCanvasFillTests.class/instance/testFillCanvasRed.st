tests
testFillCanvasRed

	canvas fill
		paint: Color red;
		path: canvas bounds;
		draw.
		
	self assertPixels: canvas bounds color: Color red
	