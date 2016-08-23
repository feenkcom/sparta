private - ffi
primIsNamed

	^ self ffiCall: #(bool moz2d_font_family_name_is_named (self))