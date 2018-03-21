private - ffi
primCreateWidth: aWidth height: aHeight fileName: aFileName

	^ self ffiCall: #(SpartaCairoPdfSurface cairo_pdf_surface_create (
		String aFileName,
		double aWidth,
		double aHeight) )