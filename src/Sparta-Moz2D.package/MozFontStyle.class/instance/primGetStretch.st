private - ffi
primGetStretch

	^ self ffiCall: #(int moz2d_font_style_get_stretch(self))