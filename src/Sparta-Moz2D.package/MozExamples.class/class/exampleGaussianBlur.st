examples
exampleGaussianBlur
	|radial path canvas |	
	
	canvas := MozCanvas extent: 400@400.
	
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	path := canvas path
		moveTo: 150@50;
		lineTo: 250@250;
		curveVia: 150@300 to: 50@250;
		close;
		finish.

	radial := canvas paint radialGradient
		innerCenter: 150@150;
		outerRadius: 100;
		stops: {0 -> Color white. 0.5 -> Color red. 1 -> Color white }.

	canvas fill
		paint: radial;
		path: path;
		draw.

	canvas stroke
		paint: Color blue;
		path: path;
		strokeOptions: (canvas strokeOptions
			width: 5);
		draw.
		
	canvas filter
		area: (0@0 extent: 300@350);
		type: (canvas gaussianBlurFilter
			stdDeviation: 5;
			source: canvas surface);
		drawOptions: (canvas drawOptions
			alpha: 0.7);
		draw.
		
	canvas asForm asMorph openInWindowLabeled: 'Shape + Blur'