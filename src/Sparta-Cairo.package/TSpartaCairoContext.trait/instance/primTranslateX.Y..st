private - ffi
primTranslateX: aX Y: aY

	^ self ffiCall: #( void cairo_translate (
			SpartaCairoCanvas canvas,
			double aX,
			double aY) )