private - ffi
primSetHintStyle: aHintStyle

	^ self ffiCall: #(void cairo_font_options_set_hint_style ( self, SpartaCairoHintStyle aHintStyle ) )