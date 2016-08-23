private - ffi
primCreateSurfaceForData: aData width: width height: height stride: stride format: aSurfaceFormat

	^ self ffiCall: #( MozSurface moz2d_draw_target_create_surface_for_data_form (
		MozCanvas canvas,
		void* aData,
		int32 width,
		int32 height,
		int32 stride,
		MozSurfaceFormat aSurfaceFormat) )