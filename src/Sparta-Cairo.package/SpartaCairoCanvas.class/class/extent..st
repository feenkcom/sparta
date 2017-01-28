instance creation
extent: anExtent
	| aSurface |
	
	aSurface := SpartaCairoImageSurface
		createExtent: anExtent
		format: SpartaCairoSurfaceFormat CAIRO_FORMAT_ARGB32.
	
	^ self create: aSurface