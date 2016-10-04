examples - text
exampleStyledText
	| canvas text |
	canvas := MozCanvas extent: 600@400.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: 20@50;
		apply.

	text := SpText fromString: 'Line 1', String cr, 'Line 2', String cr, 'Line 3', String cr, 'Line 4'.
	text attributes: { SpFontSizeAttribute new size: 35 } from: 1 to: text size.
	text attributes: { SpFontGenericFamilyAttribute new monospace } from: 1 to: 4.
	text attributes: { SpFontStyleAttribute new italic } from: 7 to: 12.
	text attributes: { SpForegroundColorAttribute new color: Color red } from: 3 to: 9.

	text drawOn: canvas.

	canvas asForm asMorph openInWindowLabeled: 'Sparta text'