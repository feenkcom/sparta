private - ffi
primFindOrCreateFontEntry: aFamilyName buffer: aBufferArray length: aBufferLength style: aMozFontStyle

	^ self ffiCall: #(MozUserFontEntry moz2d_font_user_find_or_create_user_font_entry(
		self,
		String aFamilyName,
		uint8* aBufferArray,
		uint32 aBufferLength,
		MozFontStyle aMozFontStyle))