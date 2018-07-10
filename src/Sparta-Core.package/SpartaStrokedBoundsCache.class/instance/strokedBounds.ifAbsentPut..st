api - bounds
strokedBounds: aStrokeOptions ifAbsentPut: anAbsentBlock
	<return: #Rectangle>

	self checkSession.

	(self hasCachedBounds
		and: [ self strokeOptions = aStrokeOptions ])
			ifTrue: [ ^ self bounds ].

	strokeOptions := aStrokeOptions.

	bounds := anAbsentBlock value.

	^ bounds