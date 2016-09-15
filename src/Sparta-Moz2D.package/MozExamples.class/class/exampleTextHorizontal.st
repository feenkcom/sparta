examples - text
exampleTextHorizontal
	|canvas font |
	canvas := MozCanvas extent: 700@200.

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
		horizontal;
		string: 'Horizontal';
		font: font;
		baseline: 20@30;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Horizontal'