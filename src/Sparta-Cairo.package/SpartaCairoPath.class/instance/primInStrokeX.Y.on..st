private - ffi
primInStrokeX: aX Y: aY on: aSpartaCairoCanvas
	^ self ffiCall: #(bool cairo_in_stroke (
		SpartaCairoCanvas aSpartaCairoCanvas,
		double aX,
		double aY))