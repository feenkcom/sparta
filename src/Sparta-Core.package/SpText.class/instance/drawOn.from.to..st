drawing
drawOn: aCanvas from: aStart to: anEnd
	| aRope layout |
	aRope := rope from: aStart to: anEnd.
	layout := SpartaTextLayout rope: rope.
	layout renderOn: aCanvas