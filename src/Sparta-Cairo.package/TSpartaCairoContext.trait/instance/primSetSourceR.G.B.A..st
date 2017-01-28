private - ffi
primSetSourceR: aRed G: aGreen B: aBlue A: anAlpha
	
	^ self ffiCall: #( void cairo_set_source_rgba (
			SpartaCairoCanvas canvas,
			double aRed,
			double aGreen,
			double aBlue,
			double anAlpha) )