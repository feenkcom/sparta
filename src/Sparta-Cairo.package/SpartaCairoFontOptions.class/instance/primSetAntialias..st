private - ffi
primSetAntialias: anAntialias

	^ self ffiCall: #(void cairo_font_options_set_antialias ( self, SpartaCairoAntialias anAntialias) )