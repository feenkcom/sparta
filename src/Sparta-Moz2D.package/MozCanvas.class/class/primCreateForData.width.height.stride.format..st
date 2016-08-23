private - ffi
primCreateForData: aData width: width height: height stride: stride format: aSurfaceFormat

	^ self ffiCall: #( MozCanvas moz2d_draw_target_create_for_data (
		void* aData,
		int32 width,
		int32 height,
		int32 stride,
		MozSurfaceFormat aSurfaceFormat) )