private - ffi
primSetAntialias: aCairoAntialias

	^ self ffiCall: #( void cairo_set_antialias (
		SpartaCairoCanvas canvas,
      SpartaCairoAntialias aCairoAntialias ) )