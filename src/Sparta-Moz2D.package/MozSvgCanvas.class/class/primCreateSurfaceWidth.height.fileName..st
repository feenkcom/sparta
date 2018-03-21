private - ffi
primCreateSurfaceWidth: aWidth height: aHeight fileName: aFileName

	^ self ffiCall: #(void* moz2d_draw_target_create_cairo_surface_for_svg (
		String aFileName,
		double aWidth,
		double aHeight) )