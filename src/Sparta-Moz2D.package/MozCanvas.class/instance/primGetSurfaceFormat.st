private - ffi - accessing
primGetSurfaceFormat

	^ self ffiCall: #(MozSurfaceFormat moz2d_draw_target_get_surface_format ( self ) )