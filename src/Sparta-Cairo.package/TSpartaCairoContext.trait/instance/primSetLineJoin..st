private - ffi
primSetLineJoin: aCairoJoinStyle

	^ self ffiCall: #( void cairo_set_line_join (
		SpartaCairoCanvas canvas,
      SpartaCairoJoinStyle aCairoJoinStyle ) )