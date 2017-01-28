path commands
lineTo: aPoint
	
	endPoint := self toAbsolute: aPoint.
	lastControlPoint := nil.

	self primLineToX: endPoint x Y: endPoint y