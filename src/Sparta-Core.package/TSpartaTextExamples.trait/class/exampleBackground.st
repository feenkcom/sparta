examples - attributes
exampleBackground
	| aCanvas aText |
	aCanvas := self canvas: 700 @ 500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.
	aCanvas transform
		translateBy: 200 @ 200;
		apply.

	aText := SpText fromString: 'Background'.
	aText attributes: {
			SpTextBackgroundAttribute paint: Color yellow.
			SpFontSizeAttribute size: 41 }.
	
	aCanvas text
		text: aText;
		draw.
	
	aCanvas asForm asMorph openInWindow