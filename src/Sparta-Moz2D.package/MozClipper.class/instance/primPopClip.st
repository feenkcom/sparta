private - ffi
primPopClip

	^ self ffiCall: #(void moz2d_draw_target_pop_clip ( MozCanvas canvas ))