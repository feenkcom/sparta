private - ffi
primRadialGradientInnerCenterX: innerCenterX innerCenterY: innerCenterY innerRadius: innerRadius outerCenterX: outerCenterX outerCenterY: outerCenterY outerRadius: outerRadius rawStops: rawStops stopsNum: stopsNum rawMatrix: rawMatrix extendMode: anExtendMode

	^ self ffiCall: #( MozExternalRadialGradientPattern moz2d_pattern_radial_gradient_create_flat (
		MozCanvas canvas,
		float innerCenterX,
		float innerCenterY,
		float innerRadius,
		float outerCenterX,
		float outerCenterY,
		float outerRadius,
		float* rawStops,
		uint32 stopsNum,
		float * rawMatrix,
		int anExtendMode ) )