private - ffi
primGetLanguage

	^ self ffiCall: #(char* moz2d_font_style_get_language(self))