examples - text
exampleTextLayout
	|canvas rope maxWidth textLayout |
	maxWidth := 300.

	canvas := MozCanvas extent: 700@500.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	rope := SpRope from: 'abcdefg-12345', String cr, 'hijklmadadfsdgs', String cr, 'Hello World!'.
	rope := rope attributes: { SpFontSizeAttribute new size: 70 } from: 1 to: rope size.
	rope := rope attributes: { SpTextWrapAttribute new normal } from: 1 to: rope size.

	textLayout := SpTextLayout rope: rope.
	textLayout maxWidth: maxWidth.
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