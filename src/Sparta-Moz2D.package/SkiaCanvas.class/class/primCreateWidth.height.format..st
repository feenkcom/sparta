private - ffi
primCreateWidth: width height: height format: aSurfaceFormat

	^ self
		primCreate: MozBackendType SKIA
		width: width
		height: height
		format: aSurfaceFormat