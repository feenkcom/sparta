tests
testFillCanvasTransparent

	canvas fill
		paint: Color transparent;
		path: canvas bounds;
		draw.
		
	self assertPixels: canvas bounds color: Color transparent