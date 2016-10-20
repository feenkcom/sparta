testing
containsGlobal: aRectangle
	^ self
		primContainsGlobalX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height