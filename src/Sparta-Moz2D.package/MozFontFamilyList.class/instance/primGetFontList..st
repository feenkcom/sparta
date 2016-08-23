private - ffi
primGetFontList: aReturnLength

	^ self ffiCall: #(FFIExternalArray moz2d_font_family_list_get_font_list(self, uint32* aReturnLength))