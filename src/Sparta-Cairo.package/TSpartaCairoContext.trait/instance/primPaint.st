private - ffi
primPaint

	^ self ffiCall: #(void cairo_paint ( SpartaCairoCanvas canvas ) )