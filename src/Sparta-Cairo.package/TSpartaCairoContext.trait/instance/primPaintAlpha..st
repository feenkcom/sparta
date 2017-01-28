private - ffi
primPaintAlpha: aNumber

	^ self ffiCall: #(void cairo_paint_with_alpha (
			SpartaCairoCanvas canvas,
			double aNumber ) )