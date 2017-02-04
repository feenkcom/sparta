private - ffi
primDestroy: aCairoCanvas

	^ self ffiCall: #(void cairo_destroy ( SpartaCairoCanvas aCairoCanvas ) )