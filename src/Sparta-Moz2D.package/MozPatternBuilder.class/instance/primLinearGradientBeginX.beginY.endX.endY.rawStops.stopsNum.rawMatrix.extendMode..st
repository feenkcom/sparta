private - ffi
primLinearGradientBeginX: beginX beginY: beginY endX: endX endY: endY rawStops: rawStops stopsNum: stopsNum rawMatrix: rawMatrix extendMode: anExtendMode

	^ self ffiCall: #( MozNativeLinearGradientPattern moz2d_pattern_linear_gradient_create_flat (
		DrawTarget canvas,
		float beginX,
		float beginY,
		float endX,
		float endY,
		float* rawStops,
		uint32 stopsNum,
		float * rawMatrix,
		int anExtendMode ) )