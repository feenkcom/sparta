examples - text
exampleTextVerticalSidewaysRight
	|canvas font |
	canvas := MozCanvas extent: 200@700.

	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	canvas transform
		translateBy: 100@50;
		apply.

	font := canvas font
		size: 28;
		weightThin;
		sansSerif;
		build.

	canvas text
		verticalSidewaysRight;
		string: 'Vertical sideways right';
		font: font;
		origin: 20@30;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Vertical sideways right'