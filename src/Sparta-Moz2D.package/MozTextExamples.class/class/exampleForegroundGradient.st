examples - attributes
exampleForegroundGradient
	| aCanvas aText |
	aCanvas := MozCanvas extent: 700 @ 500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.
	aCanvas transform
		translateBy: 200 @ 200;
		apply.

	aText := SpText fromString: 'Foreground'.
	aText attributes: {
			SpTextForegroundAttribute paint: (SpLinearGradient new
				begin: 0@0;
				end: 200@0;
				stops: { 0 -> Color red. 1 -> Color blue } ).
			SpTextStrikethroughAttribute new.
			SpFontSizeAttribute size: 40 }.
	
	aCanvas text
		text: aText;
		draw.
	
	aCanvas asForm asMorph openInWindow