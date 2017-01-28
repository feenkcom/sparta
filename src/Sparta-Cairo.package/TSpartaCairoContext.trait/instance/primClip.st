private - ffi
primClip

	^ self ffiCall: #(void cairo_clip ( SpartaCairoCanvas canvas ) )