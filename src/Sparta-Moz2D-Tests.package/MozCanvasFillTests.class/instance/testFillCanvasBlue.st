tests
testFillCanvasBlue

	canvas fill
		paint: Color blue;
		path: canvas bounds;
		draw.
		
	self assertPixels: canvas bounds color: Color blue
	