private - ffi
primSetSourceSurface: aCairoSurface x: aX y: aY

	^ self ffiCall: #( void cairo_set_source_surface (
			SpartaCairoCanvas canvas,
			SpartaCairoSurface aCairoSurface,
			double aX,
			double aY) )