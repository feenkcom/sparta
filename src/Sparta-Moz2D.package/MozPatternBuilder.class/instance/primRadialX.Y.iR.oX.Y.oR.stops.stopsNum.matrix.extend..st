private - ffi
primRadialX: innerCenterX Y: innerCenterY iR: innerRadius oX: outerCenterX Y: outerCenterY oR: outerRadius stops: rawStops stopsNum: stopsNum matrix: rawMatrix extend: anExtendMode

	^ self ffiCall: #( #MozNativeRadialGradientPattern moz2d_pattern_radial_gradient_create_flat (
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