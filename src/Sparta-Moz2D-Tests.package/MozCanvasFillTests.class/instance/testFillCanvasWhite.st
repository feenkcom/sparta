tests
testFillCanvasWhite

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	self assertPixels: canvas bounds color: Color white
	