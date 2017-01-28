geometry
globalBounds
	| aTransformation aBounds |
	
	aTransformation := canvas transform current.
	aBounds := self localBounds.
	aTransformation transformRectangle: aBounds.
	^ aBounds