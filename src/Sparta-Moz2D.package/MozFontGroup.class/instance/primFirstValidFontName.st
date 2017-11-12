private - ffi
primFirstValidFontName

	^ self ffiCall: #(char* moz2d_font_group_first_valid_font_name(self))