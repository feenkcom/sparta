private - ffi
primSetLineWidth: aNumber

	^ self ffiCall: #( void cairo_set_line_width (
		SpartaCairoCanvas canvas,
      double aNumber ) )