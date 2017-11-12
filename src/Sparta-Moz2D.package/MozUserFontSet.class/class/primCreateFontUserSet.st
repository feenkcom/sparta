private - ffi
primCreateFontUserSet

	^ self ffiCall: #(MozUserFontSet moz2d_font_user_set_create())