private - ffi
primGetFormat

	^ self ffiCall: #(MozSurfaceFormat moz2d_source_surface_get_format ( self ))