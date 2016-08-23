private - ffi
primGetType

	^ self ffiCall: #(MozSurfaceType moz2d_source_surface_get_type ( self ))