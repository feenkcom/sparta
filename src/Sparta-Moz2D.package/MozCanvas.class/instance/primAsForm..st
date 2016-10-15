private - ffi
primAsForm: aPixelArray

	^ self ffiCall: #(void moz2d_draw_target_as_form (self, void* aPixelArray))