instance creation
createExtent: anExtent format: aSurfaceFormat

	^ (self
		primCreateWidth: anExtent x
		height: anExtent y
		format: aSurfaceFormat) autoRelease