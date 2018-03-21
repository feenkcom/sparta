private - ffi
primCreateWidth: aWidth height: aHeight fileName: aFileName

	^ self ffiCall: #(SpartaCairoSvgSurface cairo_svg_surface_create (
		String aFileName,
		double aWidth,
		double aHeight) )