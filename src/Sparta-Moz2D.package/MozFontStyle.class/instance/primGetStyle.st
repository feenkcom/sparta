private - ffi
primGetStyle

	^ self ffiCall: #(uint8 moz2d_font_style_get_style(self))