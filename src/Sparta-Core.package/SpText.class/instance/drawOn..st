drawing
drawOn: aCanvas
	| aRope |
	aRope := rope.
	self draw: aRope on: aCanvas from: 1 to: aRope size