private - ffi
primCreateSurfaceWidth: aWidth height: aHeight fileName: aFileName

	^ self ffiCall: #(void* moz2d_draw_target_create_cairo_surface_for_pdf (
		String aFileName,
		double aWidth,
		double aHeight) )