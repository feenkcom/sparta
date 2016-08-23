private - ffi
primAppendFontFamilyGeneric: aFontFamilyType

	^ self ffiCall: #(void moz2d_font_family_list_append_family_generic(self, MozFontFamilyType aFontFamilyType))