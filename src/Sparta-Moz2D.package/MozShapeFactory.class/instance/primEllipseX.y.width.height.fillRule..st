private - ffi
primEllipseX: x y: y width: width height: height fillRule: aFillRile

	^ self ffiCall: #( MozPath moz2d_shape_ellipse (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		MozFillRule aFillRile ) )