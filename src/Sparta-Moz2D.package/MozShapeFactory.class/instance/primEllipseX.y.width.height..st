private - ffi
primEllipseX: x y: y width: width height: height

	^ self ffiCall: #( MozPath moz2d_shape_ellipse (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		FILL_RULE_WINDING ) )