private - ffi
primCreateWidth: width height: height format: aSurfaceFormat

	^ self ffiCall: #( #MozCanvas moz2d_draw_target_create (
		int32 width,
		int32 height,
		MozSurfaceFormat aSurfaceFormat) )