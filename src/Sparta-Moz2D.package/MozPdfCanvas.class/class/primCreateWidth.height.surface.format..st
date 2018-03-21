private - ffi
primCreateWidth: aWidth height: aHeight surface: aCairoSurface format: aSurfaceFormat

	^ self ffiCall: #(MozPdfCanvas moz2d_draw_target_create_for_cairo_surface (
		void* aCairoSurface,
		int32 aWidth,
		int32 aHeight,
		MozSurfaceFormat aSurfaceFormat) )