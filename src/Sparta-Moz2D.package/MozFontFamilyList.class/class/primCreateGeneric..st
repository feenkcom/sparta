private - ffi
primCreateGeneric: aMozFontFamilyType

	^ self ffiCall: #(MozFontFamilyList moz2d_font_family_list_create_generic(MozFontFamilyType aMozFontFamilyType))