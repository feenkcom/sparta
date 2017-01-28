private - ffi
primGetTransform: aCairoMatrix

	^ self ffiCall: #( void cairo_get_matrix (
		SpartaCairoCanvas canvas,
		SpartaCairoMatrix *aCairoMatrix) )