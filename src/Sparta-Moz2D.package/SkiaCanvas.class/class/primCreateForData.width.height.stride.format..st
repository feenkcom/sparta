private - ffi
primCreateForData: aData width: width height: height stride: stride format: aSurfaceFormat

	^ self
		primCreateForData: MozBackendType SKIA
		data: aData
		width: width
		height: height
		stride: stride
		format: aSurfaceFormat
		uninitialized: true