private - ffi
primFill

	^ self ffiCall: #(void cairo_fill ( SpartaCairoCanvas canvas ) )