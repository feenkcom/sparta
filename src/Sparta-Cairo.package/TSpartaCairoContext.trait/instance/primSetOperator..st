private - ffi
primSetOperator: aCairoOperator

	^ self ffiCall: #( void cairo_set_operator (
		SpartaCairoCanvas canvas,
      SpartaCairoCompositionOp aCairoOperator ) )