private - ffi
primStatus
	^ self ffiCall: #(SpartaCairoStatus cairo_surface_status (self))