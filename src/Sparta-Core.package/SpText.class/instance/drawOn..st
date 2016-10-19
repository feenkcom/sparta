drawing
drawOn: aCanvas
	| aRope layout |
	aRope := rope.
	layout := SpTextLayout rope: aRope.
	layout renderOn: aCanvas