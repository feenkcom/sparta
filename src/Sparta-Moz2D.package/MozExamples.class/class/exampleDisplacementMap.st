examples
exampleDisplacementMap
	| path canvas |	
		
	canvas := MozCanvas extent: 500@500.

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

	canvas stroke
		paint: Color red;
		path: path;
		strokeOptions: (canvas strokeOptions
			width: 5);
		draw.

	canvas filter
		area: (0@0 extent: 300@350);
		type: (canvas displacementMapFilter
			scale: 30;
			xChannelGreen;
			yChannelRed;
			source: canvas surface;
			secondSource: (canvas turbulenceFilter
				baseFrequence: 0.01;
				numOctaves: 2;
				seed: 231;
				area: (0@0 extent: 300@350);
				turbulence));
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Displacement'