shapes
ellipse: aRectangle
	| aWidth aHeight halfWidth halfHeight halfWidth055 halfHeight055 halfWidth045 halfHeight045 |

	aWidth := aRectangle width.
	aHeight := aRectangle height.

	aWidth = aHeight
		ifTrue: [ 
			| aRadius aCenter |
			aRadius := aWidth / 2.0.
			aCenter := aRectangle origin + aRadius asPoint.
			^ self circleAt: aCenter radius: aRadius ].
		
	halfWidth := aWidth / 2.0.
	halfHeight := aHeight / 2.0.
	halfWidth055 := halfWidth * 0.55.
	halfHeight055 := halfHeight * 0.55.
	halfWidth045 := halfWidth * 0.45.
	halfHeight045 := halfHeight * 0.45.

	^ canvas path
		relative;
		moveTo: aRectangle origin;
		moveTo: halfWidth @ 0;
		curveVia: halfWidth055 @ 0 and: halfWidth @ halfHeight045 to: halfWidth @ halfHeight;
		curveVia: 0 @ halfHeight055 and: halfWidth045 negated @ halfHeight to: halfWidth negated @ halfHeight;
		curveVia: halfWidth055 negated @ 0 and: halfWidth negated @ halfHeight045 negated to: halfWidth negated @ halfHeight negated;
		curveVia: 0 @ halfHeight055 negated and: halfWidth045 @ halfHeight negated to: halfWidth @ halfHeight negated;
		close;
		finish