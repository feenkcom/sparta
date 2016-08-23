private - ffi
primSetSize: aFloat

	^ self ffiCall: #(float moz2d_font_style_set_size(self, float aFloat))