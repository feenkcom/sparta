private - ffi
primMatrix: aCairoMatrix

	^ self ffiCall: #(void cairo_pattern_set_matrix (
		self,
		SpartaCairoMatrix * aCairoMatrix ) )