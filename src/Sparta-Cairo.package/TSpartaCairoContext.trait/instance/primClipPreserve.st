private - ffi
primClipPreserve

	^ self ffiCall: #(void cairo_clip_preserve ( SpartaCairoCanvas canvas ) )