accessing
area: aRectangle
	"Set an area on origin canvas where filter should be applied.
	It plays a role of source area and should be specified in user
	coordinate space.
	aRectangle must not be nil"
	
	self
		assert: [ aRectangle isNotNil ]
		description: [ 'Source area must not be nil!' ].
		
	sourceRectangle := aRectangle