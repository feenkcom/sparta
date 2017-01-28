private - ffi
primWidth

	^ self ffiCall: #(int cairo_image_surface_get_width ( self ) )