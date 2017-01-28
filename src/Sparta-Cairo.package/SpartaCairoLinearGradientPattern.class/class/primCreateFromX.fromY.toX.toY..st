private - ffi
primCreateFromX: fromX fromY: fromY toX: toX toY: toY

	^ self ffiCall: #(#SpartaCairoLinearGradientPattern cairo_pattern_create_linear (
			double fromX,
			double fromY,
			double toX,
			double toY ) )