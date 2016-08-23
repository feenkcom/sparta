private - ffi
primAppendFontFamilyName: aFontFamilyName

	^ self ffiCall: #(void moz2d_font_family_list_append_family_name(self, MozFontFamilyName aFontFamilyName))