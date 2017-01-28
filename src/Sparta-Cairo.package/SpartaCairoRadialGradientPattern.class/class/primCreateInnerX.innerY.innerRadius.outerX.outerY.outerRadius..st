private - ffi
primCreateInnerX: anInnerX innerY: anInnerY innerRadius: anInnerRadius outerX: anOuterX outerY: anOuterY outerRadius: anOuterRadius

	self ffiCall: #(SpartaCairoRadialGradientPattern cairo_pattern_create_radial (
			double anInnerX,
			double anInnerY,
			double anInnerRadius,
			double anOuterX,
			double anOuterY,
			double anOuterRadius))