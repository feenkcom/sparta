private - ffi
primCreateGeneric: aType

	^ self ffiCall: #(MozFontFamilyName moz2d_font_family_name_create_generic(MozFontFamilyType aType))