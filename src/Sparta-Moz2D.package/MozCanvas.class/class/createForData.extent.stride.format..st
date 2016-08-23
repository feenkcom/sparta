instance creation
createForData: aData extent: aPoint stride: stride format: aSurfaceFormat
	^ (self
		primCreateForData: aData
		width: aPoint x
		height: aPoint y
		stride: stride
		format: aSurfaceFormat) autoRelease