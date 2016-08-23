instance creation
createType: aBackendType extent: aPoint format: aSurfaceFormat
	^ (self
		primCreate: aBackendType
		width: aPoint x
		height: aPoint y
		format: aSurfaceFormat) autoRelease