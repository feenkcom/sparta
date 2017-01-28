path commands
moveTo: aPoint
		
	endPoint := self toAbsolute: aPoint.
	lastControlPoint := nil.
	
	self primMoveToX: endPoint x Y: endPoint y