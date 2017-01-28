private - ffi
primCurrentPointX: aX Y: aY

	^ self ffiCall: #( void cairo_get_current_point (
		SpartaCairoCanvas canvas,
		double * aX,
		double * aY ) )