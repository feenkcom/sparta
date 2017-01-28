private - ffi
primFlush

	^ self ffiCall: #(void cairo_surface_flush ( self ) )