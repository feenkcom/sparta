private - ffi
primArcCenterX: centerX centerY: centerY radius: aRadius startAngle: aStartAngle endAngle: anEndAngle 

	self ffiCall: #(void cairo_arc (
			SpartaCairoCanvas canvas,
			double centerX,
			double centerY,
			double aRadius,
			double aStartAngle,
			double anEndAngle) )