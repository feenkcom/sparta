as yet unclassified
primFlush
	^ self ffiCall: #(void moz2d_draw_target_flush (self))