private - ffi
primLineToX: aX Y: aY

	^ self ffiCall: #(void cairo_line_to (
			SpartaCairoCanvas canvas,
			double aX,
			double aY ) )