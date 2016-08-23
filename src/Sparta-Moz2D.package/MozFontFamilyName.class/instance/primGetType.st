private - ffi
primGetType

	^ self ffiCall: #(MozFontFamilyType moz2d_font_family_name_get_type (self))