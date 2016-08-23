private - ffi
primCreateDefault

	^ self ffiCall: #(MozFontStyle moz2d_font_style_create_default ())