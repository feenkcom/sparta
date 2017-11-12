private - ffi
primFirstValidFont

	^ self ffiCall: #(void* moz2d_font_group_first_valid_font(self))