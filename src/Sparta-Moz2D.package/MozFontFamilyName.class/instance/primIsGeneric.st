private - ffi
primIsGeneric

	^ self ffiCall: #(bool moz2d_font_family_name_is_generic (self))