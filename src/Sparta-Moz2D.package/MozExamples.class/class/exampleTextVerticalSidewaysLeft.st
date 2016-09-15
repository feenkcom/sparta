examples - text
exampleTextVerticalSidewaysLeft
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
		verticalSidewaysLeft;
		string: 'Vertical sideways left';
		font: font;
		baseline: 20@300;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Vertical sideways left'