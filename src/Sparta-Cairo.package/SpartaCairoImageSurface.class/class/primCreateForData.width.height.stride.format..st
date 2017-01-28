private - ffi
primCreateForData: aData width: width height: height stride: stride format: aSurfaceFormat

	^ self ffiCall: #( SpartaCairoImageSurface cairo_image_surface_create_for_data (
		void* aData,
		SpartaCairoSurfaceFormat aSurfaceFormat,
		int width,
		int height,
		int stride) )