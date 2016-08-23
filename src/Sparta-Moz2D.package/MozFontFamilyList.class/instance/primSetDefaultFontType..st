private - ffi
primSetDefaultFontType: aFontType

	^ self ffiCall: #(void moz2d_font_family_list_set_default_font_type(self, MozFontFamilyType aFontType))