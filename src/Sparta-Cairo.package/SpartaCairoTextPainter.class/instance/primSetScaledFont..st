private - ffi
primSetScaledFont: aScaledFont

	^ self ffiCall: #( void cairo_set_scaled_font (
		SpartaCairoCanvas canvas,
		SpartaCairoScaledFont aScaledFont ) )