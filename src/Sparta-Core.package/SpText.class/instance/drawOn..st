drawing
drawOn: aCanvas
	| aRope layout |
	aRope := rope.
	layout := SpMultilineTextLayout rope: aRope.
	layout renderOn: aCanvas.
	selections
		select: [ :selection | selection interval isNotEmpty ]
		thenDo: [ :selection | 
			| start end startPosition endPosition |
			start := selection interval start.
			end := selection interval end.
			startPosition := layout positionAt: start.
			endPosition := layout positionAt: end ]