private - ffi
primFormat

	^ self ffiCall: #(SpartaCairoSurfaceFormat cairo_image_surface_get_format (self) )