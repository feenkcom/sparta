private - ffi
primStroke

	^ self ffiCall: #(void cairo_stroke ( SpartaCairoCanvas canvas ) )