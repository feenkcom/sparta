private - ffi
primGetStyle

	^ self ffiCall: #(int moz2d_font_style_get_style(self))