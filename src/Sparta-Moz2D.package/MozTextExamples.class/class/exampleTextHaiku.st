examples - text
exampleTextHaiku
	| canvas rope textLayout |
	canvas := MozCanvas extent: 605 @ 265.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		translateBy: 50@20;
		apply.	

	rope := SpRope from: 'Soft words' , String cr , 'Brushing minds' , String cr , 'Are poetic gifts'.
	rope := rope
		attributes:
			{ SpTextForegroundAttribute paint: Color veryVeryDarkGray.
			  SpFontSizeAttribute size: 70.
			  SpTextWrapAttribute new normal.
			  SpTextShadowAttribute new
			    offset: 2 @ 2;
			    color: Color gray;
			    radius: 1 }
		from: 1 to: rope size.
	rope := rope
		attributes:
			{ SpFontStyleAttribute italic.
			  SpTextForegroundAttribute paint: Color darkGray.
			  SpFontWeightAttribute weight: 50 }
		from: 1
		to: 10.
	rope := rope
		attributes:
			{ SpTextForegroundAttribute paint: (SpLinearGradient new
				begin: 0@0;
				end: 500@0;
				stops: { 0 -> Color red. 1 -> Color blue }).
			  SpFontWeightAttribute weight: 800 }
		from: 26 to: rope size.
	textLayout := SpTextLayout rope: rope.
	textLayout renderOn: canvas.
	canvas asForm asMorph openInWindowLabeled: 'Haiku'