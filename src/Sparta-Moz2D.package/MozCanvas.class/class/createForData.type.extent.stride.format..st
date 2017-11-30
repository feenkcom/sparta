instance creation
createForData: aData type: aBackendType extent: aPoint stride: stride format: aSurfaceFormat
	^ (self
		primCreateForData: aBackendType
		data: aData
		width: aPoint x
		height: aPoint y
		stride: stride
		format: aSurfaceFormat
		uninitialized: false)
			initialize;
			autoRelease