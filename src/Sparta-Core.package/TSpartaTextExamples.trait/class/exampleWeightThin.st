examples - attributes
exampleWeightThin
	| aCanvas aRope aTextLayout |

	aCanvas := self canvas: 700@500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.

	aCanvas transform
		translateBy: 200@200;
		apply.

	aRope := SpRope from: 'Thin'.
	aRope := aRope
		attributes: {
			SpFontWeightAttribute thin.
			SpFontSizeAttribute size: 40 }
		from: 1
		to: aRope size.

	aTextLayout := SpMultilineTextLayout rope: aRope.
	aTextLayout renderOn: aCanvas.

	aCanvas asForm asMorph openInWindow