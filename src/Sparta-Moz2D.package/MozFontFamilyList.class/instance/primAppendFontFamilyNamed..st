private - ffi
primAppendFontFamilyNamed: aFontFamilyNameString

	^ self ffiCall: #(void moz2d_font_family_list_append_family_named_utf8(self, char* aFontFamilyNameString))