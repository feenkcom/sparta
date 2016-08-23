private - ffi
primCreateNamed: aFontFamilyName quoted: aQuoted
	"aQuoted is a boolean"

	^ self ffiCall: #(MozFontFamilyList moz2d_font_family_list_create_named_utf8(char* aFontFamilyName, bool aQuoted))