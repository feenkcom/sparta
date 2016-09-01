accessing
to: aPoint
	"Set a destination point on the canvas where result of filter
	operation should be blended. aPoint should be specified in user
	coordinate space.
	If destination point is not specified an origin of source area
	will be used.
	aPoint must not be nil"
	<optional>
	
	self
		assert: [ aPoint isNotNil ]
		description: [ 'Destination point must not be nil!' ].

	destinationPoint := aPoint