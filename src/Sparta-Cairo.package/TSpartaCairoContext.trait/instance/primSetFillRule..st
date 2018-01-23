private - ffi
primSetFillRule: aCairoFillRule

	^ self ffiCall: #( void cairo_set_fill_rule (
		SpartaCairoCanvas canvas,
      SpartaCairoFillRule aCairoFillRule ) )