testing
containsLocal: aRectangle
	^ self
		primContainsLocalX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height