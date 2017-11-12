private - ffi
primHasFamily: aFamilyName

	^ self ffiCall: #(bool moz2d_font_user_set_has_family (
        self,
        String aFamilyName))