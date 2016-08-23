private - ffi
primCreate: aBackendType width: width height: height format: aSurfaceFormat

	^ self ffiCall: #( #MozCanvas moz2d_draw_target_create_type (
		MozBackendType aBackendType,
		int width,
		int height,
		MozSurfaceFormat aSurfaceFormat) )