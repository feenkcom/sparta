private - ffi
primCreateContext: aGrContext width: aWidth height: aHeight format: aSurfaceFormat headless: isHeadless

	^ self ffiCall: #(SkiaCanvas moz2d_gl_skia_draw_target_create_from_context (
		SkiaGrContext aGrContext,
		int32 aWidth, 
		int32 aHeight,
		MozSurfaceFormat aSurfaceFormat,
		bool isHeadless))