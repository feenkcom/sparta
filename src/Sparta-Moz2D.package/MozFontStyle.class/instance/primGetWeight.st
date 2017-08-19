private - ffi
primGetWeight

	^ self ffiCall: #(uint16 moz2d_font_style_get_weight(self))