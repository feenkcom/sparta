private - ffi
primSetMiterLimit: aNumber

	^ self ffiCall: #( void cairo_set_miter_limit (
		SpartaCairoCanvas canvas,
      double aNumber ) )