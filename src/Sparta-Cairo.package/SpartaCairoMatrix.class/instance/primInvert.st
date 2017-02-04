private - ffi
primInvert

	^ self ffiCall: #(SpartaCairoStatus cairo_matrix_invert ( self ) )