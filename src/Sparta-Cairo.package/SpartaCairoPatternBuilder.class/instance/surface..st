accessing
surface: aCairoSurfacePaint
	| aSurfacePattern |
	
	aSurfacePattern := SpartaCairoSurfacePattern surface: aCairoSurfacePaint source.
	^ aSurfacePattern