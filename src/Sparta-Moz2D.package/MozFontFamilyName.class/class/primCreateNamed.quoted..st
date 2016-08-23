private - ffi
primCreateNamed: aFamilyName quoted: aQuoted

	^ self ffiCall: #(MozFontFamilyName moz2d_font_family_name_create_named_utf8(char* aFamilyName, bool aQuoted))