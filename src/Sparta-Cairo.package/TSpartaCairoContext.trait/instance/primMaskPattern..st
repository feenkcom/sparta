private - ffi
primMaskPattern: aCairoPattern

	^ self ffiCall: #(void cairo_mask (
		SpartaCairoCanvas canvas,
		SpartaCairoPattern aCairoPattern ) )