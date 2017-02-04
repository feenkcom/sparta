private - ffi
primGetAntialias

	^ self ffiCall: #(SpartaCairoAntialias cairo_font_options_get_antialias ( self ) )