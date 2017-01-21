examples - text
exampleTextLayout
	|canvas rope maxWidth textLayout |
	maxWidth := 310.

	canvas := MozCanvas extent: 700@500.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	rope := SpRope from: 'abcdef🚀-12345', String cr, 'hijklmadadfsdgs', String cr, 'Hello World!'.
	rope := rope attributes: { SpFontSizeAttribute size: 70 } from: 1 to: rope size.
	rope := rope attributes: { SpTextWrapAttribute normal } from: 1 to: rope size.
	rope := rope attributes: { SpTextTransformationAttribute new
		scaleBy: 0.2 } from: 15 to: 30.

	textLayout := SpMultilineTextLayout new
		rope: rope
		maxWidth: maxWidth.
	textLayout renderOn: canvas.

	canvas stroke
		paint: Color red;
		path: (0@0 extent: textLayout extent);
		draw.
	
	canvas stroke
		paint: Color blue;
		path: (0@0 extent: maxWidth @ textLayout height);
		draw.

	canvas asForm asMorph openInWindow