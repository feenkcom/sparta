examples - attributes
exampleBackground
	| aCanvas aRope aTextLayout |

	aCanvas := MozCanvas extent: 700@500.
	aCanvas fill
		paint: Color white;
		path: aCanvas bounds;
		draw.
	aCanvas transform
		translateBy: 200@200;
		apply.

	aRope := SpRope from: 'Background'.
	aRope := aRope
		attributes: {
			SpTextBackgroundAttribute paint: Color yellow.
			SpFontSizeAttribute size: 40 }
		from: 1
		to: aRope size.

	aTextLayout := SpTextLayout rope: aRope.
	aTextLayout renderOn: aCanvas.

	aCanvas asForm asMorph openInWindow