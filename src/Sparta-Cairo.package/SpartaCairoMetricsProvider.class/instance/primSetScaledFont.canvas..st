private - ffi
primSetScaledFont: aScaledFont canvas: aCanvas

	^ self ffiCall: #( void cairo_set_scaled_font (
		SpartaCairoCanvas aCanvas,
		SpartaCairoScaledFont aScaledFont ) )