shapes
lineFrom: aFromPoint to: aToPoint
	^ canvas path
		moveTo: aFromPoint;
		lineTo: aToPoint;
		finish