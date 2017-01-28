private - ffi
primCurveViaX: x1 Y: y1 viaX: x2 Y: y2 toX: x3 Y: y3
	
	^ self nbCall: #(void cairo_curve_to (
			SpartaCairoCanvas canvas,
			double x1,
			double y1,
			double x2,
			double y2,
			double x3,
			double y3 ) )