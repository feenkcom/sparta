private - ffi
primGetHintStyle

	^ self ffiCall: #(SpartaCairoHintStyle cairo_font_options_get_hint_style ( self ) )