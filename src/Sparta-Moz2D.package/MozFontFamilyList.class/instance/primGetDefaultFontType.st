private - ffi
primGetDefaultFontType

	^ self ffiCall: #(MozFontFamilyType moz2d_font_family_list_get_default_font_type(self))