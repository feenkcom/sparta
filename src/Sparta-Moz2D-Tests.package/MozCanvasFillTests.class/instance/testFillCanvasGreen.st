tests
testFillCanvasGreen

	canvas fill
		paint: Color green;
		path: canvas bounds;
		draw.
		
	self assertPixels: canvas bounds color: Color green
	