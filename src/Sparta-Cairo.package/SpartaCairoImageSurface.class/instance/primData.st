private - ffi
primData

	^ self ffiCall: #(uchar* cairo_image_surface_get_data ( self ) )