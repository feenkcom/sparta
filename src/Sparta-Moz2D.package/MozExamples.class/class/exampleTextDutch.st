examples
exampleTextDutch
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
		language: 'nl';
		stretchUltraExpanded;
		named: 'Helvetica Neue';
		sansSerif;
		build.

	canvas text
		paint: Color red;
		string: 'IJselijk koud is het IJ, maar altijd dichtbij.';
		font: font;
		baseline: 20@30;
		draw.

	canvas asForm asMorph openInWindowLabeled: 'Text'