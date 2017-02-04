examples - attributes
exampleForeground
	| aCanvas aText |
	aCanvas := self canvas: 700 @ 500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.
	aCanvas transform
		translateBy: 200 @ 200;
		apply.

	aText := SpText fromString: 'Foreground'.
	aText attributes: {
			SpTextForegroundAttribute paint: Color blue.
			SpFontSizeAttribute size: 40 }.
	
	aCanvas text
		text: aText;
		draw.
	
	aCanvas asForm asMorph openInWindow