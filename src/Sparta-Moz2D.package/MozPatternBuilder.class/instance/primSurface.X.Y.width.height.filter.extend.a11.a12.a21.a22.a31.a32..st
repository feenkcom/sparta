private - ffi
primSurface: aSurface X: samplingX Y: samplingY width: samplingWidth height: samplingHeight filter: aSamplingFilter extend: aExtendMode a11: a11 a12: a12 a21: a21 a22: a22 a31: a31 a32: a32

	^ self ffiCall: #( MozNativeSurfacePattern moz2d_pattern_surface_create (
		MozSurface aSurface,
		int32 samplingX,
		int32 samplingY,
		int32 samplingWidth,
		int32 samplingHeight,
		MozSamplingMode aSamplingFilter,
		MozExtendMode aExtendMode,
		float a11,
		float a12,
		float a21,
		float a22,
		float a31,
		float a32) )