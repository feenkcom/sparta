examples - attributes
exampleWeightBold
	| aCanvas aRope aTextLayout |

	aCanvas := self canvas: 700@500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.

	aCanvas transform
		translateBy: 200@200;
		apply.

	aRope := SpRope from: 'Bold'.
	aRope := aRope
		attributes: {
			SpFontWeightAttribute bold.
			SpFontSizeAttribute size: 40 }
		from: 1
		to: aRope size.

	aTextLayout := SpMultilineTextLayout rope: aRope.
	aTextLayout renderOn: aCanvas.

	aCanvas asForm asMorph openInWindow