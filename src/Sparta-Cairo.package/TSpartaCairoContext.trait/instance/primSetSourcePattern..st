private - ffi
primSetSourcePattern: aCairoPattern

	^ self ffiCall: #( void cairo_set_source (
			SpartaCairoCanvas canvas,
			SpartaCairoPattern aCairoPattern) )