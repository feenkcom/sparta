accessing
flush
	self isValid
		ifFalse: [ self error: 'Pdf canvas is no more valid. Create a new one' ].

	super flush.

	self class primSurfaceDestroy: self pdfSurface.
	self release