private - ffi
primRoundedRectangleX: x y: y width: width height: height tlr: tlr trr: trr brr: brr blr: blr

	^ self ffiCall: #( MozPath moz2d_shape_rounded_rectangle (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		float tlr,
		float trr,
		float brr,
		float blr,
		FILL_RULE_WINDING ) )