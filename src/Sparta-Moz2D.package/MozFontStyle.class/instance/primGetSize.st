private - ffi
primGetSize

	^ self ffiCall: #(float moz2d_font_style_get_size(self))