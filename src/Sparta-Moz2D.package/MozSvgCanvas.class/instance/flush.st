accessing
flush
	self isValid
		ifFalse: [ self error: 'Svg canvas is no more valid. Create a new one' ].

	super flush.

	self class primSurfaceDestroy: self svgSurface.
	self release