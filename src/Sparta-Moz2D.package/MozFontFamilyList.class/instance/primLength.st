private - ffi
primLength

	^ self ffiCall: #(size_t moz2d_font_family_list_length(self))