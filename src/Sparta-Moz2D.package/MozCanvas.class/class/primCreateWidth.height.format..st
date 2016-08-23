private - ffi
primCreateWidth: width height: height format: aSurfaceFormat

	^ self ffiCall: #( #MozCanvas moz2d_draw_target_create (
		int width,
		int height,
		MozSurfaceFormat aSurfaceFormat) )