private - ffi
primInFillX: aX Y: aY on: aSpartaCairoCanvas
	^ self ffiCall: #(bool cairo_in_fill (
		SpartaCairoCanvas aSpartaCairoCanvas,
		double aX,
		double aY))