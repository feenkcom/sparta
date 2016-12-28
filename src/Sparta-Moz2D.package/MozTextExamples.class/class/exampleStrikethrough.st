examples - attributes
exampleStrikethrough
	| aCanvas aText |
	aCanvas := MozCanvas extent: 700 @ 500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.
	aCanvas transform
		translateBy: 200 @ 200;
		apply.

	aText := SpText fromString: 'Strikethrough'.
	aText attributes: {
			SpTextStrikethroughAttribute new.
			SpFontSizeAttribute size: 40 }.
	
	aCanvas text
		text: aText;
		draw.
	
	aCanvas asForm asMorph openInWindow