examples - text
exampleTextVerticalUpRight
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
		verticalUpright;
		string: 'Vertical upright';
		font: font;
		origin: 20@30;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Vertical upright text'