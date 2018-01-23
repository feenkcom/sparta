private - ffi
primSetFillRule: aCairoFillRule on: aSpartaCairoCanvas

	^ self ffiCall: #( void cairo_set_fill_rule (
		SpartaCairoCanvas aSpartaCairoCanvas,
      SpartaCairoFillRule aCairoFillRule ) )