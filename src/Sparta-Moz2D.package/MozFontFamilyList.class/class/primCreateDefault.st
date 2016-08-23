private - ffi
primCreateDefault
	"aQuoted is a boolean"

	^ self ffiCall: #(MozFontFamilyList moz2d_font_family_list_create())