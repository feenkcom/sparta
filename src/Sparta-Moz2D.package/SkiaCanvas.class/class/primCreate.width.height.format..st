private - ffi
primCreate: aBackendType width: width height: height format: aSurfaceFormat

	^ self ffiCall: #( SkiaCanvas moz2d_draw_target_create_type (
		MozBackendType aBackendType,
		int32 width,
		int32 height,
		MozSurfaceFormat aSurfaceFormat) )