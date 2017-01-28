examples
exampleFillPathLinearGradient
	| path canvas |
	
	canvas := MozCanvas extent: 500@500.
	
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
		paint: (canvas paint linearGradient
			begin: 200@100;
			end: 300@300;
			stops: {
				0 -> Color red.
				1 -> Color blue
			});
		path: path;
		draw.

	canvas asForm asMorph openInWindow