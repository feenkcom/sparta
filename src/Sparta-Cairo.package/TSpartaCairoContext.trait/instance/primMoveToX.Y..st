private - ffi
primMoveToX: aX Y: aY

	^ self ffiCall: #(void cairo_move_to (
			SpartaCairoCanvas canvas,
			double aX,
			double aY ) )