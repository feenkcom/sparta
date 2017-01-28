converting
asForm
	| theData aBitmap |
	
	self flush.

	self format = SpartaCairoSurfaceFormat CAIRO_FORMAT_ARGB32
		ifFalse: [ self error: 'Only ARGB32 is supported' ].

	theData := FFIExternalArray fromHandle: self primData getHandle type: FFIUInt32 size: self primWidth * self primStride / 4.
	aBitmap := Bitmap newFrom: theData.
	^ Form extent: self extent depth: 32 bits: aBitmap