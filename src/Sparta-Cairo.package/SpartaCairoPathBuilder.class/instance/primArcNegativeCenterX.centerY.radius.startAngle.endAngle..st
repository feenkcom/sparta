private - ffi
primArcNegativeCenterX: centerX centerY: centerY radius: aRadius startAngle: aStartAngle endAngle: anEndAngle 

	self ffiCall: #(void cairo_arc_negative (
			SpartaCairoCanvas canvas,
			double centerX,
			double centerY,
			double aRadius,
			double aStartAngle,
			double anEndAngle) )
				
			