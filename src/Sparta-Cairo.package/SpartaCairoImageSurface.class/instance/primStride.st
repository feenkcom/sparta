private - ffi
primStride

	^ self ffiCall: #(int cairo_image_surface_get_stride ( self ) )