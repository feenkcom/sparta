private - ffi
primCreateWidth: aWidth height: aHeight format: aSurfaceFormat

	^ self ffiCall: #(SpartaCairoImageSurface cairo_image_surface_create (
		SpartaCairoSurfaceFormat	aSurfaceFormat,
		int	 aWidth,
		int	 aHeight ) )