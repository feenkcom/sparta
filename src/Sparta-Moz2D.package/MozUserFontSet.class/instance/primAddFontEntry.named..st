private - ffi
primAddFontEntry: aUserFontEntry named: aFamilyName

	^ self ffiCall: #(void moz2d_font_user_entry_add (
        self,
        String aFamilyName,
        MozUserFontEntry aUserFontEntry))