drawing
drawOn: aCanvas from: aStart to: anEnd
	| aRope layout |
	aRope := rope from: aStart to: anEnd.
	layout := SpTextLayout rope: aRope.
	layout renderOn: aCanvas.
	selections
		select: [ :selection | selection interval isNotEmpty ]
		thenDo: [ :selection | 
			| start end |
			start := selection interval start.
			end := selection interval end. ]