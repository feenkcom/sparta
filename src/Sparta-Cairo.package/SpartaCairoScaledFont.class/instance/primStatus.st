private - ffi
primStatus
	^ self ffiCall: #(SpartaCairoStatus cairo_scaled_font_status ( self ) )