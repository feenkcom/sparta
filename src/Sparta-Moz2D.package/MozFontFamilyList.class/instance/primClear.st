private - ffi
primClear

	^ self ffiCall: #(void moz2d_font_family_list_clear(self))