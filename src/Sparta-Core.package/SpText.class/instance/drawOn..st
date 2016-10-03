drawing
drawOn: aCanvas
	| aRope layout |
	aRope := rope.
	layout := SpartaTextLayout rope: rope.
	layout renderOn: aCanvas