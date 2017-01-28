private - ffi
primHeight

	^ self ffiCall: #(int cairo_image_surface_get_height ( self ) )