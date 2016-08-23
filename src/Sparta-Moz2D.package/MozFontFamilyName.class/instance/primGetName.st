private - ffi
primGetName

	^ self ffiCall: #(char* moz2d_font_family_name_get_name (self))