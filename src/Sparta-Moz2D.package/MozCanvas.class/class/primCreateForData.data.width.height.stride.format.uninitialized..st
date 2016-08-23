private - ffi
primCreateForData: aBackendType data: aData width: width height: height stride: stride format: aSurfaceFormat uninitialized: Uninitialized

	^ self ffiCall: #( #MozCanvas moz2d_draw_target_create_for_data_type (
		MozBackendType aBackendType,
		void* aData,
		int32 width,
		int32 height,
		int32 stride,
		MozSurfaceFormat aSurfaceFormat,
		bool Uninitialized) )