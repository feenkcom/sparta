private - ffi
primGetWeight

	^ self ffiCall: #(int moz2d_font_style_get_weight(self))