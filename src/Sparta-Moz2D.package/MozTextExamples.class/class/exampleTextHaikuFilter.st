examples - text
exampleTextHaikuFilter
	| canvas rope textLayout |
	canvas := MozCanvas extent: (605 @ 265) * 3.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.

	canvas transform
		push;
		scaleBy: 0.7;
		apply.
	
	canvas transform
		push;
		translateBy: 100@80;
		apply.	

	rope := SpRope from: '全身心自在' , String cr , '身感風如馭氣天' , String cr , '下雪富士山'.
	rope := rope
		attributes:
			{ SpTextForegroundAttribute paint: Color black.
			  SpFontSizeAttribute size: 200.
			  SpTextWrapAttribute new normal.
			  SpTextShadowAttribute new
			    offset: 2 @ 2;
			    color: Color gray;
			    radius: 1 }
		from: 1 to: rope size.
	rope := rope
		attributes:
			{ SpFontStyleAttribute italic.
			  SpTextStrikethroughAttribute new paint: Color blue.
			  SpTextForegroundAttribute paint: Color darkGray.
			  SpFontWeightAttribute weight: 50. }
		from: 1
		to: 5.
	rope := rope
		attributes:
			{ SpTextForegroundAttribute paint: (SpLinearGradient new
				begin: 0@0;
				end: 500@0;
				stops: { 0 -> Color red. 1 -> Color blue }).
			  SpFontWeightAttribute weight: 800 }
		from: 14 to: rope size.
	textLayout := SpMultilineTextLayout rope: rope.
	textLayout renderOn: canvas.
	
	canvas transform pop.
	
	canvas filter
		area: (canvas bounds);
		type: (canvas displacementMapFilter
			scale: 30;
			xChannelBlue;
			yChannelRed;
			source: canvas surface;
			secondSource: (canvas gaussianBlurFilter
				stdDeviation: 9;
				source: canvas));
		draw.
	
	canvas filter
		type: (canvas filters nashville: canvas);
		area: canvas bounds;
		draw.
		
	canvas := (canvas similar: 605 @ 265) fill
		path: (0@0 extent: 605 @ 265);
		paint: canvas;
		draw;
		canvas.
	
	canvas asForm asMorph openInWindowLabeled: 'Haiku'