testing
containsGlobal: aRectangle scaledBy: aFactorPoint
	^ self
		primContainsGlobalX: aRectangle left * aFactorPoint x
		y: aRectangle top * aFactorPoint y
		width: aRectangle width * aFactorPoint x
		height: aRectangle height * aFactorPoint y