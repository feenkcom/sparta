examples
exampleFillRectangle
	| canvas |
	
	canvas := self canvas: 500@500.
	
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
		
	canvas fill
		paint: Color red;
		path: (100@100 extent: 200@200);
		draw.

	canvas asForm asMorph openInWindow