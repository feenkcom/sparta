private - ffi
primRectangleX: aX Y: aY width: aWidth height: aHeight

	^ self ffiCall: #(void cairo_rectangle (
			SpartaCairoCanvas canvas,
			double aX,
			double aY,
			double aWidth,
			double aHeight ) )