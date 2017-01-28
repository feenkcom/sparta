private - ffi
primApplyTransform: aCairoMatrix

	^ self ffiCall: #( void cairo_transform (
		SpartaCairoCanvas canvas,
		SpartaCairoMatrix *aCairoMatrix) )