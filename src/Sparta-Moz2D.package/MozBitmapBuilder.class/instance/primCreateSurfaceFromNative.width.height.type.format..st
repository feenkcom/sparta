private - ffi
primCreateSurfaceFromNative: aNativeSurface width: aWidth height: aHeight type: aSurfaceType format: aSurfaceFormat

	^ self ffiCall: #( MozSurface moz2d_draw_target_create_surface_from_native (
		MozCanvas canvas,
		MozNativeSurfaceType aSurfaceType,
		MozSurfaceFormat aSurfaceFormat,
		int32 aWidth,
		int32 aHeight,
		int aNativeSurface) )