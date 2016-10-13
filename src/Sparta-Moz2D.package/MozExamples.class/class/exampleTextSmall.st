examples
exampleTextSmall
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
		size: 13;
		weightThin;
		sansSerif;
		build.

	canvas text
		string: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry';
		font: font;
		baseline: 10@30;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Text with small font'