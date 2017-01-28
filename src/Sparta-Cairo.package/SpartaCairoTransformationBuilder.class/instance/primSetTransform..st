private - ffi
primSetTransform: aCairoMatrix

	^ self ffiCall: #( void cairo_set_matrix (
		SpartaCairoCanvas canvas,
		SpartaCairoMatrix *aCairoMatrix) )