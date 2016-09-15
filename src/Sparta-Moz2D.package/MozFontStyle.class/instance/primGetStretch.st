private - ffi
primGetStretch

	^ self ffiCall: #(MozTextFontStretch moz2d_font_style_get_stretch(self))