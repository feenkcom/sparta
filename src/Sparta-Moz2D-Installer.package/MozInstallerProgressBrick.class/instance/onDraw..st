morph-drawing
onDraw: aCanvas
	| progressBounds |
	super onDraw: aCanvas.
	
	progressBounds := self brickBounds origin extent: ((self width * self progress) asInteger @ self height).
	aCanvas fillRectangle: progressBounds color: self progressColor.