examples - attributes
exampleForegroundGradient
	| aCanvas aRope aTextLayout |

	aCanvas := MozCanvas extent: 700@500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.
	aCanvas transform
		translateBy: 200@200;
		apply.

	aRope := SpRope from: 'Foreground'.
	aRope := aRope
		attributes: {
			SpTextForegroundAttribute paint: (SpLinearGradient new
				begin: 0@0;
				end: 200@0;
				stops: { 0 -> Color red. 1 -> Color blue } ).
			SpTextStrikethroughAttribute new.
			SpFontSizeAttribute size: 40 }
		from: 1
		to: aRope size.

	aTextLayout := SpTextLayout rope: aRope.
	aTextLayout renderOn: aCanvas.

	aCanvas asForm asMorph openInWindow