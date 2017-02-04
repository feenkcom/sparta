private - ffi
primCreate

	^ self ffiCall: #( SpartaCairoFontOptions cairo_font_options_create () )