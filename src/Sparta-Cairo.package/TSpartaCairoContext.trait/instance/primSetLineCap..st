private - ffi
primSetLineCap: aCairoCapStyle

	^ self ffiCall: #( void cairo_set_line_cap (
		SpartaCairoCanvas canvas,
      SpartaCairoCapStyle aCairoCapStyle ) )