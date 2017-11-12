private - ffi
primCreateDefault
	^ self ffiCall: #(MozFontFamilyList moz2d_font_family_list_create())