drawing
drawOn: aCanvas from: aStart to: anEnd
	| aRope layout |
	aRope := rope from: aStart to: anEnd.
	layout := SpTextLayout rope: aRope.
	layout renderOn: aCanvas