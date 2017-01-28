examples
exampleFillPath
	| path canvas |
	
	canvas := SpartaCairoCanvas extent: 500@500.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	path := canvas path
		moveTo: 200@100;
		lineTo: 300@300;
		lineTo: 100@300;
		close;
		finish.

	canvas fill
		paint: Color red;
		path: path;
		draw;
		paint: (Color blue alpha: 0.5);
		draw.

	canvas asForm asMorph openInWindow