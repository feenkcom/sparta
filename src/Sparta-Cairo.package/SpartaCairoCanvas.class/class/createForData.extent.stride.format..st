instance creation
createForData: aData extent: aPoint stride: stride format: aSurfaceFormat
	| aSurface |
	
	aSurface := SpartaCairoImageSurface
		createForData: aData
		extent: aPoint
		stride: stride
		format: aSurfaceFormat.

	^ self create: aSurface